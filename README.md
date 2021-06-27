# Overview

This repo contain different examples on how to create Virtual Machines in vCloud Director using Terrafrom. I have 3 different examples. This was my way to try to implement and learn different Terrafrom features to achieve the same task. :
1. Create VMs using Count (Use-Count-Index) https://www.terraform.io/docs/language/meta-arguments/count.html
2. Create VMs using (Use-For-Each)  https://www.terraform.io/docs/language/meta-arguments/for_each.html
3. Create VMs using (Use-complex-Map which incluced foreach and flatten function) https://www.terraform.io/docs/language/functions/flatten.html, This repo really goes in deep how to use foreach and flatten function https://github.com/ned1313/terraform-tuesdays/tree/main/2021-01-25-ForLoops

## Prerequisites
Terraform

## How to use?
1. Clone the repo locally using "git clone"
2. Update the variable.tf with the values corresponding to your enviroment.
3. Then you can simply run the "terrafrom plan" and "terrafrom apply" to apply the firewalls rules from the rules.csv to edge gateway in vCloud Director.

