import {defineConfig} from '@playwright/test';
export default defineConfig({testDir:'./tests/browser',timeout:60000,expect:{timeout:15000},retries:0,workers:1,reporter:[['list'],['json',{outputFile:'.cache/browser-results.json'}]],use:{baseURL:'http://127.0.0.1:4188/'},webServer:{command:'python -B serve-check.py',url:'http://127.0.0.1:4188/',reuseExistingServer:false}});
