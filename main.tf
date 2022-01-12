terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

variable "pvt_key" {}
variable "pub_key" {}

provider "scaleway" {
  zone = "fr-par-1"
  region = "fr-par"
  project_id = "0846ffa3-3110-490b-99f7-a0c9690c4705"
}
