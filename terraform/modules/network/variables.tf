
variable "name" {
  description = "Name of the network"
  type        = string
  default     = "default_network"

  validation {
    condition     =  can(regex("[A-z0-9]{1,}", var.name))
    error_message = "Invalid name."
  }
}

variable "domain" {
  description = "Which domain we'll use"
  type        = string
  default     = "default"

  validation {
    condition     =  can(regex("[A-z0-9]{1,}", var.domain))
    error_message = "Invalid domain."
  }
}

variable dhcp {
  description = "Shall we set a DHCP or not?"
  type = bool
  default = true
}

variable libvirt_uri {
  description = "Our libvirt URI to manage VM"
  type = string
  default = "qemu:///system"
}

variable dns {
  description = "Shall we set a DNS or not?"
  type = bool
  default = true
}

variable subnet_cidr {
  description = "Which addresses our dhcp will use"
  type = list
  default = ["10.42.42.0/24"]
#  validation {
#    condition = can(regex("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/(3[0-2]|[1-2][0-9]|[0-9]))$", var.addresses))
#    error_message = "Invalid addresses."
#  }

}
