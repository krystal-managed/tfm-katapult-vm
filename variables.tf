variable "name" {
  type = string
}

variable "group_id" {
  type    = string
  default = ""
}

variable "package" {
  type = string
}

variable "disk_template" {
  type = string
}

variable "public_ips" {
  type    = number #
  default = 1
}

variable "disks" {
  default = []
}

# SG vars
variable "create_sg" {
  type    = bool
  default = true
}

variable "rules_in" {
  default = []
}

variable "rules_out" {
  default = []
}

variable "enable_krystal" {
  type    = bool
  default = true
}

variable "enable_zabbix" {
  type    = bool
  default = true
}

variable "enable_web" {
  type    = bool
  default = false
}