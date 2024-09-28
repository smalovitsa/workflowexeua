group "default" {
  targets = ["test", "format-check", "lint", "spell-check", "sort-package-json"]
}

target "test" {
  context = "."
  dockerfile = "Dockerfile"
  target = "test-stage"
  tags = ["smalovitsa/e2eexeua:test"]
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

