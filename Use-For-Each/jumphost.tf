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
variable "vcd_allow_unverified_ssl" {}

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
  name = var.vapp_name
}

resource "vcd_vapp_org_network" "vappOrgNet" {
    vapp_name         = var.vapp_name

 # Comment below line to create an isolated vApp network
  org_network_name  = var.org_network

  depends_on = [vcd_vapp.vapp1]
}

# Create the VM in the vApp
resource "vcd_vapp_vm" "VMs" {
  for_each = toset(var.vm_name)
  #count = var.vm_instances
  vapp_name = var.vapp_name
  name = each.value
  catalog_name = var.catalog
  template_name = var.template
  power_on = var.power_on
  computer_name = each.value
  memory = var.mem
  cpus = var.cpu_num
  cpu_cores = var.cores

  # Map the network from the data source to the VM
  network {
      name = var.org_network
      type = "org"
      ip_allocation_mode = "POOL"
      is_primary = true
  }

  depends_on = [vcd_vapp.vapp1]
}