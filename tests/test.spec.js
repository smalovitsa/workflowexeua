const { test, expect } = require('@playwright/test');

test('check page title', async ({page}) => {
    await page.goto('https://exe.ua');

    const title = await page.title();
    expect(title).toBe('EXE.ua');
});