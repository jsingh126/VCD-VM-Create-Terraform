terraform {
  required_providers {
    vcd = {
      version = ">= 3.2.0"
      source = "vmware/vcd"
    }
  }
}



# variables
variable "vcd_user" {}
#variable "vcd_pass" {}
variable "vcd_org" {}
variable "vcd_vdc" {}
variable "vcd_url" {}
variable "vcd_allow_unverified_ssl" {
    default = true
}

# Configure the VMware vCloud Director Provider
provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_pass
  org                  = var.vcd_org
  vdc                  = var.vcd_vdc
  url                  = var.vcd_url
  allow_unverified_ssl = var.vcd_allow_unverified_ssl
}





# Create the vApp
resource "vcd_vapp" "vapp1" {
  for_each = var.instances_vapps
  name = each.key
}

resource "vcd_vapp_org_network" "vappOrgNet" {
    for_each = var.instances_vapps
    vapp_name         = each.key

 # Comment below line to create an isolated vApp network
  org_network_name  = each.value.vapp_netss

  depends_on = [vcd_vapp.vapp1]
}



resource "vcd_vapp_vm" "VMs" {
  for_each = {
    # Generate a unique string identifier for each instance
    for vm in local.instances_vapps : 
    "${vm.vapp_names}.${vm.vms}}" => vm
    }
  #count = var.value.vms
  vapp_name = each.value.vapp_names
  name = each.value.vms
  catalog_name = var.catalog
  template_name = var.template
  power_on = false
  computer_name = each.value.vms
  memory = var.mem
  cpus = var.cpu_num
  cpu_cores = var.cores
  memory_hot_add_enabled = true
  

  
  # Map the network from the data source to the VM
  network {
      name = each.value.vapps_netss
      type = "org"
      #ip = "192.168.2.5"
      ip_allocation_mode = "POOL"
      is_primary = true
  }

  depends_on = [vcd_vapp.vapp1]
}
