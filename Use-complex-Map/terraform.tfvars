vcd_user = ""

vcd_pass = ""

vcd_org = ""

vcd_vdc = "" 

vcd_url = ""

#logging = true
vcd_allow_unverified_ssl = true

/* this is a map of VMs which will be created example : 
instances_vapps = {
    matrix = {
        vapp_netss = "test"
        vm_list = ["neo", "trinity"]
    }
    GOT = {
        vapp_netss = "test"
        vm_list = ["aarya", "sansa"]
    }
    }
*/

instances_vapps = 

catalog = ""
template = ""

# you can set these values to null if you  want these values to default to the vaules from template.
mem = null
cpu_num = null
cores = null
power_on = null