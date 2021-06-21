

variable "vcd_pass" {
  type    = string
  default = "Ravi@1987"
}


variable "org_network" {
  type    = string
  default = "test"
}

variable "vapp_name" {
  type    = string
  default = "tvapp1"
}

#variable "vm_name" {
#  type    = list(string)
#  default = ["neo", "trinity", "morpheus"]
#}

variable "vm_name" {
  type    = string
  default = "vm1"
}
variable "catalog" {
  type    = string
  default = "Demo-Catalog"
}

variable "template" {
  type    = string
  default = "vApp01"
}

variable vm_instances {
  description = "Number of VMs"
  type        = number
  default     = 2
}