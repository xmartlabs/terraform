# Module Doc

## What it does

This module generates an ec2 instance, this module requires the network module.
This module needs four input variables, region, ami id,user_data_path, and network interface id. The rest of input variables have a default value but if you want you could set it.
The user_data_path is the path of a script to be run after creation and provisioning your instance as you need.

Also, this module has three output variables if you need it: 
- Private ip
- Public ip
- Instance id

## How to use this module
In the root module, you have to creat a module block :

```
module "module-ec2-linux-web" {
    source = "github.com/xmartlabs/terraform.git?ref=module-network-linux-web/modules/module-ec2-linux-web"
    region = var.region
    amiid  = var.amiid
    id_network_interface= module.module-network-linux-web.network_interface_id
    user_data_path= "user_data.tmpl"
}
```
The id_network_interface is an output variable for the network module, you call an output variable of this wey: module.<name module>.<name output variable>

