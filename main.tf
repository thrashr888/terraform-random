resource "template_file" "timestamp" {
  filename = "timestamp.txt"

  provisioner "local-exec" {
    command = "date +%s > timestamp.txt"
  }

  provisioner "local-exec" {
    command = "terraform taint template_file.timestamp"
  }
}

output "timestamp" {
  value = "${template_file.timestamp.rendered}"
}
