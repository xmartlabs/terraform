# Module Doc

## What it does

This module generates all de network necessaries to deploy web services, this module did not create de aws-ec2 instance.
This module creates:
-Vpc
-Subnet
-Security group and open de https, http ports and ssh port
-Gateway
-Route table
-Network interface

## How to use this module

In the root module, you have to creat a module block :

``` 
module "module-network-linux-web" {
	 source = "github.com/xmartlabs/terraform.git?ref=module-network-linux-web/modules/module-network-linux-web"
	 
}
```

If you want, like an argument in the module block, you could set values for the input variables defined in this module (e.g. subnet_prefix), if you don't want to set it, exist default values for all the input except the region variable, this is obligatory to set.

### E.g.

```
module "module-network-linux-web" {
	 source = "github.com/xmartlabs/terraform.git?ref=module-network-linux-web/modules/module-network-linux-web"
     region = "us-east-1"
     tags= [{ Project = "test module", State = "test" }]
}
```