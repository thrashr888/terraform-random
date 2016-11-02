data "template_file" "random" {
  template = "${value}"

  vars {
    value = "${uuid()}"
  }
}
