#output "hostnames" {
#  value = libvirt_domain.domain.*.name
#}

#output "ips" {
#  value = libvirt_domain.domain.*.network_interface.0.addresses
#}

output "host_and_ip" {
  value = tomap({
    for domain in libvirt_domain.domain.* : domain.name => domain.network_interface.0.addresses.0
  })
}
