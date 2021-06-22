

variable "vcd_pass" {
  type    = string  
}

variable "catalog" {
  type    = string  
}

variable "template" {
  type    = string  
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
/*
#sample map for vapps 
variable project {
  description = "Map of vapp config."
  type        = map
  default     = {
    client-webapp = {
     
      vms    = 2
      vapp_nets = "VDC-Network1"
      
    },
    internal-webapp = {
      
      vms    = 1
      vapp_nets = "VDC-Network1"
    }
  }
}
*/


variable "instances_vapps" {
   default = {       
}
}

#flatten the map to list so each vapp, network and then vm name are in list. to see example use terrafrom console to list local.instances_vapps
locals {
  instances_vapps = flatten([
    for inst_key, inst in var.instances_vapps : [
      for vol_key in inst.vm_list : {
        vapp_names = inst_key
        vapps_netss  = inst.vapp_netss
        vms = vol_key
      }
    ]
  ])
}
