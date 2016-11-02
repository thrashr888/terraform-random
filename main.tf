data "template_file" "random" {
  template = "${value}"

  vars {
    value = "${uuid()}"
  }
}

resource "null_resource" "default" {
  triggers {
    template = "${data.template_file.random.rendered}"
  }
}

output "random" {
  value = "${data.template_file.random.rendered}"
}
