import globals from "globals";
import pluginJs from "@eslint/js";

export default [
	{ ignores: ["e2e/", "playwright.config.js", "tests/", "npm-audit-report"] },
	{ files: ["**/*.js"], languageOptions: { sourceType: "script" } },
	{ languageOptions: { globals: globals.browser } },
	pluginJs.configs.recommended,
];
