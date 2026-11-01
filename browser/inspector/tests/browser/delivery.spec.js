import {test, expect} from '@playwright/test';
import {createHash} from 'node:crypto';
import {readFile} from 'node:fs/promises';

const sha = data => createHash('sha256').update(data).digest('hex');
test('staged project-prefix inventory covers every source/runtime/legal byte', async ({page, request}) => {
  await page.goto('./');
  const response = await request.get('./inventory.json'); expect(response.ok()).toBe(true);
  const inventory = await response.json(); expect(inventory.schema).toBe('lexicon.inspector-site.v1');
  let bytes = (await response.body()).length;
  for (const [name, expected] of Object.entries(inventory.files)) {
    expect(name).not.toMatch(/(?:^|\/)(?:native-cases|request)\.json$/);
    expect(name).not.toContain('..');
    const file = await request.get('./' + name); expect(file.ok(), name).toBe(true);
    const data = await file.body(); expect(data.length, name).toBe(expected.bytes);
    expect(sha(data), name).toBe(expected.sha256); bytes += data.length;
  }
  expect(bytes).toBeLessThanOrEqual(5_000_000);
  const provenance = await (await request.get('./provenance.json')).json();
  expect(provenance.commit).toBe(inventory.commit); expect(provenance.dirty).toBe(inventory.dirty);
  expect(provenance.current_book_review_ready).toBe(false);
  for (const name of ['src/reference.rs', 'src/reference_sidecar.rs', 'src/composition_query.rs', 'browser/inspector/src/lib.rs']) {
    const file = await request.get('./source/' + name); expect(file.ok()).toBe(true);
    expect(sha(await file.body())).toBe(provenance.source_files[name].sha256);
  }
  expect((await request.get('./native-cases.json')).status()).toBe(404);
  expect((await request.get('./request.json')).status()).toBe(404);
  const wasm = await request.get('./pkg/lexicon_inspector_bg.wasm');
  expect(wasm.headers()['content-type']).toContain('application/wasm');
  await expect(page.getByRole('link', {name: 'Complete repository ZIP at this commit'})).toHaveAttribute('href', provenance.full_repository_zip);
});

test('source, license and artifact routes remain usable when WASM fails', async ({page, request}) => {
  await page.route('**/*.wasm', route => route.abort());
  await page.goto('./'); await expect(page.locator('#error')).toContainText('Rust could not complete');
  await expect(page.locator('#run')).toBeDisabled();
  for (const label of ['Read Rust core, adapter and lockfiles', 'Portable inspector source ZIP',
    'Compiled WebAssembly', 'JavaScript bindings', 'Reproducible build instructions',
    'Build provenance', 'File hashes', 'Software license scope', 'Content license scope',
    'Dependency and Rust notices']) {
    const link = page.getByRole('link', {name: label, exact: true}); await expect(link).toBeVisible();
    const response = await request.get(await link.getAttribute('href')); expect(response.ok(), label).toBe(true);
  }
  await page.getByRole('link', {name: 'Read Rust core, adapter and lockfiles'}).click();
  await expect(page.getByRole('heading', {name: 'Rust sources and locks'})).toBeVisible();
});

test('resolved dependency and pinned Rust notices are complete and verbatim', async ({request}) => {
  const dependencies = await (await request.get('./dependencies.json')).json();
  expect(dependencies.length).toBeGreaterThan(20);
  expect(dependencies.some(p => p.name === 'wasm-bindgen-macro')).toBe(true);
  expect(dependencies.some(p => p.name === 'serde_derive')).toBe(true);
  for (const dependency of dependencies) {
    expect(Object.keys(dependency.notices).length).toBeGreaterThan(0);
    for (const [name, expected] of Object.entries(dependency.notices)) {
      const data = await (await request.get('./' + name)).body(); expect(sha(data)).toBe(expected.sha256);
    }
  }
  const rust = await (await request.get('./rust/provenance.json')).json();
  expect(rust.rust_release).toBe('1.95.0');
  for (const [name, expected] of Object.entries(rust.files)) {
    const data = await (await request.get('./rust/' + name)).body(); expect(sha(data)).toBe(expected.sha256);
  }
  const notices = await readFile('../../browser/inspector/legal/rust/COPYRIGHT-library.html');
  expect(sha(notices)).toBe(rust.files['COPYRIGHT-library.html'].sha256);
});
