terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone = "fr-par-1"
  region = "fr-par"
  project_id = "0846ffa3-3110-490b-99f7-a0c9690c4705"
}
resource "scaleway_instance_ip" "public_ip" {
  }
resource "scaleway_instance_server" "web" {
  type = "DEV1-S"
  image = "ubuntu_focal"
  tags = ["front", "web"]
  ip_id = scaleway_instance_ip.public_ip.id
  root_volume {}
}