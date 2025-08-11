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

variable "ssh_key" {
  description = "SSH public key"
  type = string
}

resource "hcloud_ssh_key" "public_key" {
  name = "public-key"
  public_key = var.ssh_key
}

resource "hcloud_server" "my_server" {
  name = "my-server"
  server_type = "cx22"
  image = "debian-12"
  location = "hel1"

  ssh_keys = [
    hcloud_ssh_key.public_key.id
  ]
}

output "server_ip" {
  description = "Server IP address"
  value = hcloud_server.my_server.ipv4_address
}
