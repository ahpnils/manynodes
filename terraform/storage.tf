resource "libvirt_volume" "os_image" {
  name   = var.os_image_name
  source = var.os_image_url
  pool   = var.storage_pool
}

resource "libvirt_volume" "volume" {
  name           = "node${count.index}.qcow2"
  base_volume_id = libvirt_volume.os_image.id
  count          = var.nodes_quantity
  pool           = var.storage_pool
}

resource "libvirt_cloudinit_disk" "cinit_disk" {
  name      = "node${count.index}-cinit.iso"
  pool      = var.storage_pool
  count     = var.nodes_quantity
  meta_data = data.template_file.node_metadata[count.index].rendered
  user_data = data.template_file.node_userdata[count.index].rendered
}

data "template_file" "node_metadata" {
  template = file("${path.module}/../cloud-init/meta-data")
  count    = var.nodes_quantity
  vars = {
    hostname = "node${count.index}"
  }
}

data "template_file" "node_userdata" {
  template = file("${path.module}/../cloud-init/user-data")
  count    = var.nodes_quantity
  vars = {
    hostname           = "node${count.index}"
    username           = var.user
    uid                = var.uid
    gid                = var.uid
    password           = var.password
    ssh_authorized_key = var.ssh_authorized_key
    packages           = jsonencode(var.packages)
  }
}

