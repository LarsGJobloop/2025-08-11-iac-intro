terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.52.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type = string
  sensitive = true
}

resource "hcloud_server" "my_server" {
  name = "my-server"
  server_type = "cx22"
  image = "debian-12"
  location = "hel1"
}
