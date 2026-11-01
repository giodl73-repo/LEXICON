import {test,expect} from '@playwright/test';
import {readFile} from 'node:fs/promises';
const cases=JSON.parse(await readFile('../../target/inspector-preview/native-cases.json','utf8'));
test('draft linked WASM returns every native canonical response exactly',async({page})=>{
 await page.goto('./');await expect(page.locator('#run')).toBeEnabled();const responses=await page.evaluate(async cases=>{const module=await import('./pkg/lexicon_inspector.js');await module.default();return cases.map(c=>module.inspect(c.input));},cases);for(let i=0;i<cases.length;i++)expect(responses[i],cases[i].name).toBe(cases[i].canonical);
});
test('worker inspects own documents and invalidates stale exports',async({page})=>{
 await page.goto('./');await expect(page.locator('#run')).toBeEnabled();const req=JSON.parse(cases.find(c=>c.name==='reference-only').input);req.reference=req.reference.replace('Sample Entry','Own supplied example');await page.locator('#reference').fill(req.reference);await page.locator('#run').click();await expect(page.locator('#report')).toContainText('Own supplied example');const result=JSON.parse(await page.locator('#report').textContent());expect(result.ok).toBe(true);expect(result.checks.workspace_files_markdown_and_review_assurance).toBe('not_performed');expect(result.query).toBeNull();await expect(page.locator('#exports button')).toHaveCount(3);await page.locator('#reference').fill('broken');await expect(page.locator('#report')).toBeEmpty();await expect(page.locator('#exports button')).toHaveCount(0);await page.locator('#run').click();await expect(page.locator('#report')).toContainText('LEXICON-REFERENCE');
});
