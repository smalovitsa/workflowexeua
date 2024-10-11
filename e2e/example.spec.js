const { test, expect } = require("@playwright/test");

test("check page title", async ({ page }) => {
	await page.goto("https://exe.ua");

	const title = await page.title();
	expect(title).toBe(
		"Інтернет-магазин exe.ua: комп'ютери, комплектуючі, ноутбуки, мережеве обладнання, програмне забезпечення, сервери | Опт, роздріб, ПДВ, ТОВ",
	);
});

test("should load the homepage", async ({ page }) => {
	await page.goto("https://hard.kiev.ua");
	await expect(page).toHaveTitle("Найкращі серверні рішення для вашого бізнесу | HARD.kiev.ua");
});
