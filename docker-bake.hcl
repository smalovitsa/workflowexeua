group "default" {
  targets = ["export-report","export-audit-report","format-check", "export-lint-report", "spell-check", "sort-package-json"]
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

target "export-lint-report" {
  context = "."
  dockerfile = "Dockerfile"
  target = "export-lint-report"
  tags = ["smalovitsa/e2eexeua:lint-report"]
  output = ["type=local,dest=./lint-report"]
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

