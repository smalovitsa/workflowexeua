group "default" {
  targets = ["test", "format-check", "lint", "spell-check", "sort-package-json"]
}

target "test" {
  context = "."
  dockerfile = "Dockerfile"
  target = "test-stage"
  tags = ["my-image:test"]
}

target "format-check" {
  context = "."
  dockerfile = "Dockerfile"
  target = "format-check"
  tags = ["my-image:format-check"]
}

target "lint" {
  context = "."
  dockerfile = "Dockerfile"
  target = "lint-code"
  tags = ["my-image:lint"]
}

target "spell-check" {
  context = "."
  dockerfile = "Dockerfile"
  target = "spell-check"
  tags = ["my-image:spell-check"]
}

target "sort-package-json" {
  context = "."
  dockerfile = "Dockerfile"
  target = "sort-package-json"
  tags = ["my-image:sort-package-json"]
}

