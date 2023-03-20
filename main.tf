terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }
  
  byte_length = 8
}

output "random" {
  value = random_id.random.hex
}

