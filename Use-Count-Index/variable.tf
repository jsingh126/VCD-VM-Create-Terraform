

variable "vcd_pass" {
  type    = string
  
}


variable "org_network" {
  type    = string
  
}

variable "vapp_name" {
  type    = string
  
}

#variable "vm_name" {
#  type    = list(string)
#  default = ["neo", "trinity", "morpheus"]
#}

variable "vm_name" {
  type    = string
  
}
variable "catalog" {
  type    = string
  
}

variable "template" {
  type    = string
  
}

variable vm_instances {
  description = "Number of VMs"
  type        = number
  
}

variable "mem" {
  type = string  
}

variable "cpu_num" {
  type = number
  
}
variable "cores" {
  type = number
}

variable "power_on" {
  type = bool
}