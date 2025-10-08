variable "name" {
  type = string
}

variable "hostname" {
  type = string
  nullable = true
  default = null
}

variable "vm_group" {
  type = string
  nullable = true
  default = null
}

variable "group_id" {
  type    = string
  nullable = true
  default = null
}

variable "package" {
  type = string
}

variable "disk_template" {
  type = string
}

variable "public_ips" {
  type    = number
  default = 1
}

variable "disks" {
  default = []
}
