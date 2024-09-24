const { test, expect } = require("@playwright/test");

test("check page title", async ({ page }) => {
	await page.goto("https://exe.ua");

	const title = await page.title();
	expect(title).toBe("EXE.ua");
});

test("header of exe.ua", async ({ page }) => {
	await page.goto("https://exe.ua");

	const header = await page.locator("header");

	await expect(header).toBeVisible();

	const logo = await page.locator(".logo");
	await expect(logo).toBeVisible();
});
