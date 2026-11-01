import {test, expect} from '@playwright/test';
import {readFile, writeFile, mkdir} from 'node:fs/promises';
const cases = JSON.parse(await readFile('../../target/inspector-preview/native-cases.json', 'utf8'));
const prefix = process.env.LEXICON_BASE_URL ? 'live-' : '';

async function record(name, value) {
  await mkdir('.cache', {recursive: true});
  await writeFile('.cache/' + prefix + name, JSON.stringify(value, null, 2) + '\n');
}

test('draft linked WASM returns every native canonical response exactly', async ({page}) => {
  await page.goto('./'); await expect(page.locator('#run')).toBeEnabled();
  const evidence = await page.evaluate(async cases => {
    const module = await import('./pkg/lexicon_inspector.js'); await module.default();
    const responses = [], timings = [];
    for (const item of cases) {
      const start = performance.now();
      responses.push(module.inspect(item.input));
      timings.push({name: item.name, request_utf8_bytes: new TextEncoder().encode(item.input).length,
        direct_wasm_ms: performance.now() - start});
    }
    return {responses, timings, user_agent: navigator.userAgent};
  }, cases);
  for (let i = 0; i < cases.length; i++) expect(evidence.responses[i], cases[i].name).toBe(cases[i].canonical);
  await record('parity-timings.json', {scope: 'One direct WASM call per retained native case; descriptive only',
    checked_at_utc: new Date().toISOString(), user_agent: evidence.user_agent, cases: evidence.timings});
});

test('worker inspects own documents and invalidates stale exports', async ({page}) => {
  const start = Date.now(); await page.goto('./'); await expect(page.locator('#run')).toBeEnabled();
  const startup = Date.now() - start;
  const req = JSON.parse(cases.find(c => c.name === 'reference-only').input);
  req.reference = req.reference.replace('Sample Entry', 'Own supplied example');
  await page.locator('#reference').fill(req.reference);
  const compute = Date.now(); await page.locator('#run').click();
  await expect(page.locator('#report')).toContainText('Own supplied example');
  const roundtrip = Date.now() - compute;
  const result = JSON.parse(await page.locator('#report').textContent());
  expect(result.ok).toBe(true);
  expect(result.checks.workspace_files_markdown_and_review_assurance).toBe('not_performed');
  expect(result.query).toBeNull(); await expect(page.locator('#exports button')).toHaveCount(3);
  await record('worker-timings.json', {scope: 'Single navigation and own-input worker task including browser-driver wait; descriptive only',
    checked_at_utc: new Date().toISOString(), user_agent: await page.evaluate(() => navigator.userAgent),
    navigation_to_ready_ms: startup, worker_roundtrip_with_browser_wait_ms: roundtrip,
    reference_utf8_bytes: Buffer.byteLength(req.reference), entries: result.reference.entry_count,
    views: result.reference.view_count});
  await page.locator('#reference').fill('broken');
  await expect(page.locator('#report')).toBeEmpty(); await expect(page.locator('#exports button')).toHaveCount(0);
  await page.locator('#run').click(); await expect(page.locator('#report')).toContainText('LEXICON-REFERENCE');
});
