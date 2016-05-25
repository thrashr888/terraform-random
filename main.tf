resource "template_file" "random" {
  filename = "${value}"

  vars {
    value = "${uuid()}"
  }
}
