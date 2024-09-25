import globals from "globals";
import pluginJs from "@eslint/js";


export default [
  {ignores : ["e2e/", "playwright.config.js", "tests/"]},
  {files: ["**/*.js"], languageOptions: {sourceType: "script"}},
  {languageOptions: { globals: globals.browser }},
  pluginJs.configs.recommended,
];