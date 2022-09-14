
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}

resource "libvirt_network" "networks_modules" {
  name      = var.name
  domain    = var.domain
  mode      = "nat"
  addresses = var.subnet_cidr
  dhcp {
    enabled = var.dhcp
  }
  dns {
    enabled = var.dns
  }
}
