module "manynodes_net" {
  source = "./modules/network"
  name = var.network_name  
  domain = var.domain
  subnet_cidr = var.subnet_cidr
  # dhcp = true  # enabled if not precised
  # dns = true   # enabled if not precised
}
