resource "libvirt_domain" "domain" {
  name   = "node${count.index}"
  memory = var.memory
  vcpu   = var.vcpus
  cpu {
    mode = "host-passthrough"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

  disk {
    volume_id = element(libvirt_volume.volume.*.id, count.index)
  }

  network_interface {
    network_name   = var.network_name
    wait_for_lease = true
  }
  cloudinit = libvirt_cloudinit_disk.cinit_disk[count.index].id

  count = var.nodes_quantity
}

