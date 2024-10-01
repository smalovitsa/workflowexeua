group "default" {
  targets = ["export-report","export-audit-report","format-check", "lint", "spell-check", "sort-package-json"]
}

target "export-report" {
  context = "."
  dockerfile = "Dockerfile"
  target = "export-report"
  tags = ["smalovitsa/e2eexeua:test"]
  output = ["type=local,dest=./html-report"]
}

target "export-audit-report"{
  context = "."
  dockerfile = "Dockerfile"
  target = "export-audit-report"
  output = ["type=local,dest=./npm-audit-report"]
}

target "format-check" {
  context = "."
  dockerfile = "Dockerfile"
  target = "format-check"
  tags = ["smalovitsa/e2eexeua:format-check"]
}

target "lint" {
  context = "."
  dockerfile = "Dockerfile"
  target = "lint-code"
  tags = ["smalovitsa/e2eexeua:lint"]
}

target "spell-check" {
  context = "."
  dockerfile = "Dockerfile"
  target = "spell-check"
  tags = ["smalovitsa/e2eexeua:spell-check"]
}

target "sort-package-json" {
  context = "."
  dockerfile = "Dockerfile"
  target = "check-package-json"
  tags = ["smalovitsa/e2eexeua:check-package-json"]
}

