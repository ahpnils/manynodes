resource "libvirt_network" "manynodes_net" {
  name = var.network_name
  domain = var.domain
  mode = "nat"
  addresses = var.subnet_cidr
  dhcp {
    enabled = true
  }
  dns {
    enabled = true
  }
  #hosts {
  #  hostname = "node${count.index}"
  #  ip = "my.ip.address.2"
  #}
  #count = var.nodes_quantity
}
