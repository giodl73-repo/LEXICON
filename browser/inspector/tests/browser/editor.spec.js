import {test, expect} from '@playwright/test';
import {readFile} from 'node:fs/promises';

const cases = JSON.parse(await readFile('../../target/inspector-preview/native-cases.json', 'utf8'));
const example = JSON.parse(cases.find(c => c.name === 'declared-query').input);
const reference = example.reference;
async function open(page) {
  await page.goto('./');
  await expect(page.locator('#run')).toBeEnabled();
}
async function inspect(page) {
  await page.locator('#run').click();
  await expect(page.locator('#report')).not.toBeEmpty();
  return JSON.parse(await page.locator('#report').textContent());
}
async function saved(page, label) {
  const pending = page.waitForEvent('download');
  await page.getByRole('button', {name: label, exact: true}).click();
  return readFile(await (await pending).path());
}

async function capture(page, path, info) {
  for (let attempt = 0; attempt < 3; attempt++) {
    try {
      await page.screenshot({path, fullPage: true, animations: 'disabled'});
      return;
    } catch (error) {
      if (attempt === 2 || !String(error).includes('Page.captureScreenshot')) throw error;
      info.annotations.push({type: 'screenshot-protocol-retry', description: `${path}: ${String(error)}`});
      // Only retry this Chromium capture operation, after two compositor frames.
      // Behavioral assertions and whole-test retries remain unchanged.
      await page.evaluate(() => new Promise(resolve => requestAnimationFrame(() => requestAnimationFrame(resolve))));
    }
  }
}

test('three documents export exact current/request/native/canonical bytes', async ({page}) => {
  await open(page);
  await page.getByRole('button', {name: 'Load declared query example', exact: true}).click();
  const result = await inspect(page);
  expect(result.ok).toBe(true);
  expect(result.query.declared_state).toBe('complete');
  await expect(page.locator('#summary')).toContainText('NOT PERFORMED');
  await expect(page.locator('#summary')).toContainText('declared state: complete');
  for (const key of ['reference', 'relations', 'query']) {
    expect((await saved(page, `Save current ${key}`)).toString('utf8')).toBe(example[key]);
    expect((await saved(page, `Save canonical ${key}`)).toString('utf8')).toBe(result[key].canonical_text);
  }
  expect((await saved(page, 'Save exact request')).toString('utf8')).toBe(result.request_json);
  expect((await saved(page, 'Save native report')).toString('utf8')).toBe(await page.locator('#report').textContent());
  await page.locator('#reference').fill(reference.replace('Authored inspector example only.', 'Changed source.'));
  await expect(page.locator('#exports button')).toHaveCount(0);
  const rejected = await inspect(page);
  expect(rejected.ok).toBe(false);
  expect(rejected.diagnostic.message).toContain('source digest does not match');
  await page.getByRole('button', {name: 'Load reference example', exact: true}).click();
  const recovered = await inspect(page);
  expect(recovered.ok).toBe(true); expect(recovered.relations).toBeNull(); expect(recovered.query).toBeNull();
});

test('BOM and CRLF imports remain byte exact until explicit LF editing copy', async ({page}) => {
  await open(page);
  const bytes = Buffer.from('\uFEFF' + reference.replaceAll('\n', '\r\n'), 'utf8');
  await page.locator('#reference-file').setInputFiles({name: 'original.lexicon', mimeType: 'text/plain', buffer: bytes});
  await expect(page.getByRole('button', {name: 'Save original reference', exact: true})).toBeEnabled();
  expect(await saved(page, 'Save original reference')).toEqual(bytes);
  expect(await saved(page, 'Save current reference')).toEqual(bytes);
  const rejected = await inspect(page); expect(rejected.ok).toBe(false);
  await page.getByRole('button', {name: 'Create LF copy of reference', exact: true}).click();
  await expect(page.locator('#report')).toBeEmpty();
  expect((await saved(page, 'Save current reference')).toString('utf8')).toBe(reference);
  expect(await saved(page, 'Save original reference')).toEqual(bytes);
  expect((await inspect(page)).ok).toBe(true);
  await page.getByRole('button', {name: 'Clear inputs', exact: true}).click();
  await expect(page.getByRole('button', {name: 'Save original reference', exact: true})).toBeDisabled();
  await expect(page.locator('#exports button')).toHaveCount(0);
});

test('bad UTF-8, file size and UTF-8/envelope limits preserve recoverable input', async ({page}) => {
  await open(page); await page.locator('#reference').fill(reference);
  for (const [buffer, diagnostic] of [
    [Buffer.from([0xc3, 0x28]), 'not valid bounded UTF-8'],
    [Buffer.alloc(524289), 'exceeds 512 KiB'],
  ]) {
    await page.locator('#reference-file').setInputFiles({name: 'bad.txt', mimeType: 'text/plain', buffer});
    await expect(page.locator('#error')).toContainText(diagnostic);
    expect(await page.locator('#reference').inputValue()).toBe(reference);
  }
  await expect(page.locator('#reference')).not.toHaveAttribute('maxlength');
  const paste = await page.locator('#reference').evaluate(element => {
    const transfer = new DataTransfer(); transfer.setData('text/plain', 'x'.repeat(524289));
    return element.dispatchEvent(new ClipboardEvent('paste', {clipboardData: transfer, cancelable: true, bubbles: true}));
  });
  expect(paste).toBe(false);
  await expect(page.locator('#error')).toContainText('paste exceeds 512 KiB');
  expect(await page.locator('#reference').inputValue()).toBe(reference);
  await page.locator('#reference').fill('🌿'.repeat(150000));
  await page.locator('#run').click(); await expect(page.locator('#error')).toContainText('512 KiB of UTF-8');
  await page.locator('#reference').fill('\u0001'.repeat(400000));
  await page.locator('#run').click(); await expect(page.locator('#error')).toContainText('envelope exceeds 2 MiB');
  await page.locator('#reference').fill(reference); expect((await inspect(page)).ok).toBe(true);
});

test('late file completion cannot overwrite a newer edit', async ({page}) => {
  await page.addInitScript(() => {
    window.FileReader = class {
      abort() {}
      readAsArrayBuffer(file) {
        file.arrayBuffer().then(value => setTimeout(() => { this.result = value; this.onload?.(); }, 500));
      }
    };
  });
  await open(page);
  await page.locator('#reference-file').setInputFiles({name: 'late.txt', mimeType: 'text/plain', buffer: Buffer.from('older input')});
  await page.locator('#reference').fill(reference);
  await page.waitForTimeout(650);
  expect(await page.locator('#reference').inputValue()).toBe(reference);
  await expect(page.getByRole('button', {name: 'Save original reference', exact: true})).toBeDisabled();
  expect((await inspect(page)).ok).toBe(true);
});

test('five-second file deadline retains prior input and permits recovery', async ({page}) => {
  await page.addInitScript(() => { window.FileReader = class { readAsArrayBuffer() {} abort() {} }; });
  await open(page); await page.locator('#reference').fill(reference);
  await page.locator('#reference-file').setInputFiles({name: 'stalled.txt', mimeType: 'text/plain', buffer: Buffer.from('unused')});
  await expect(page.locator('#run')).toBeDisabled();
  await expect(page.locator('#error')).toContainText('file read timed out after 5 seconds');
  expect(await page.locator('#reference').inputValue()).toBe(reference);
  expect((await inspect(page)).ok).toBe(true);
});

test('twelve-second worker startup deadline and restart recover', async ({page}) => {
  await page.route('**/worker.js', route => route.fulfill({contentType: 'text/javascript', body: '// stalled startup'}));
  await page.goto('./'); await page.locator('#reference').fill(reference);
  await expect(page.locator('#error')).toContainText('startup timed out after 12 seconds');
  await expect(page.locator('#run')).toBeDisabled();
  await page.unroute('**/worker.js');
  await page.getByRole('button', {name: 'Restart Rust worker', exact: true}).click();
  await expect(page.locator('#run')).toBeEnabled(); expect((await inspect(page)).ok).toBe(true);
});

test('ten-second compute deadline clears results and restart preserves input', async ({page}) => {
  await page.route('**/worker.js', route => route.fulfill({contentType: 'text/javascript', body: "postMessage({type:'ready'});onmessage=()=>{};"}));
  await open(page); await page.locator('#reference').fill(reference); await page.locator('#run').click();
  await expect(page.locator('#error')).toContainText('Inspection timed out after 10 seconds');
  await expect(page.locator('#exports button')).toHaveCount(0);
  await page.unroute('**/worker.js');
  await page.getByRole('button', {name: 'Restart Rust worker', exact: true}).click();
  await expect(page.locator('#run')).toBeEnabled(); expect((await inspect(page)).ok).toBe(true);
});

test('worker crash is recoverable and retired worker results stay fenced', async ({page}) => {
  let crashes = true;
  const canonical = cases.find(c => c.name === 'reference-only').canonical;
  await page.route('**/worker.js', route => route.fulfill({contentType: 'text/javascript', body: crashes ?
    "throw new Error('injected fault');" :
    `postMessage({type:'ready'});onmessage=({data})=>setTimeout(()=>postMessage({type:'result',id:data.id,canonical:${JSON.stringify(canonical)}}),700);`}));
  await page.goto('./'); await expect(page.locator('#error')).toContainText('Rust worker failed');
  crashes = false;
  await page.getByRole('button', {name: 'Restart Rust worker', exact: true}).click();
  await expect(page.locator('#run')).toBeEnabled(); await page.locator('#reference').fill(reference);
  await page.locator('#run').click(); await page.locator('#reference').fill('newer invalid input');
  await page.waitForTimeout(900);
  await expect(page.locator('#report')).toBeEmpty(); await expect(page.locator('#exports button')).toHaveCount(0);
  await page.unroute('**/worker.js');
  await page.getByRole('button', {name: 'Restart Rust worker', exact: true}).click();
  await expect(page.locator('#run')).toBeEnabled(); expect((await inspect(page)).ok).toBe(false);
});

test('mobile keyboard flow renders paths as inert text without overflow', async ({page}, info) => {
  await page.setViewportSize({width: 390, height: 844}); await open(page);
  const sample = page.getByRole('button', {name: 'Load declared query example', exact: true});
  await sample.focus(); await page.keyboard.press('Enter');
  await page.locator('#run').focus(); await page.keyboard.press('Enter');
  await expect(page.locator('#summary')).toContainText('declared state: complete');
  expect(await page.locator('#report a').count()).toBe(0);
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth)).toBe(true);
  await capture(page, '.cache/editor-mobile.png', info);
  await page.setViewportSize({width: 1280, height: 900});
  await capture(page, '.cache/editor-desktop.png', info);
});
