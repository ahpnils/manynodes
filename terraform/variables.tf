variable "libvirt_uri" {
  default = "qemu:///system"
}

variable "network_name" {
  default = "manynodes"
}

variable "domain" {
  default = "manynodes.local"
}

variable "subnet_cidr" {
  default = ["10.42.0.0/24"]
}

variable "os_image_url" {
  default = "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2"
}

variable "os_image_name" {
  default = "manynodes_baseimage.qcow2"
}

variable "storage_pool" {
  default = "default"
}

variable "nodes_quantity" {
  default = 2
}

variable "vcpus" {
  default = 1
}

variable "memory" {
  default = 1024
}

variable "user" {
  default = "tfuser"
}

variable "uid" {
  default = "1001"
}

variable "password" {
  default = "password"
}

variable "ssh_authorized_key" {
  default = "ssh-rsa AAAAAunused"
}

variable "packages" {
  default = ["lsof","iftop"]
}
