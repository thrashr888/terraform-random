variable "timestamp" {
  default = "0"
}

resource "template_file" "timestamp" {
  filename = "timestamp.txt"

  vars {
    last_timestamp = "${var.timestamp}"
  }

  provisioner "local-exec" {
    command = "date +%s > timestamp.txt"
  }

  provisioner "local-exec" {
    command = "curl -X PUT https://atlas.hashicorp.com/api/v1/environments/$ATLAS_CONFIGURATION_SLUG/variables --header X-Atlas-Token:$ATLAS_TOKEN --data variables[timestamp]=$(date +%s.%N)"
  }
}

output "last-timestamp" {
  value = "${var.timestamp}"
}

output "timestamp" {
  value = "${template_file.timestamp.rendered}"
}
