terraform {
  required_providers {
    vcd = {
      version = ">= 3.1.0"
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
  count = 2
  vapp_name = var.vapp_name
  name = "${var.vm_name}-${count.index}"
  catalog_name = var.catalog
  template_name = var.template
  power_on = false
  computer_name = var.vm_name
  memory = 4096
  cpus = 2
  cpu_cores = 1

  # Map the network from the data source to the VM
  network {
      name = var.org_network
      type = "org"
      #ip = "192.168.2.5"
      ip_allocation_mode = "POOL"
      is_primary = true
  }

  depends_on = [vcd_vapp.vapp1]
}