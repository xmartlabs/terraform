# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Project = "not created", State = "not created" }]
}

# Networking
variable "vpc" {
  description = "The definition of vpc"
  default     = [{ name = "module_vpc", cidr_block = "10.0.0.0/16", instance_tenancy = "default", enable_dns_hostnames = true, enable_dns_support = true }]
}

variable "subnet_prefix" {
  description = "The subnet prefix"
  default     = [{ name = "module_subnet", cidr_block = "10.0.1.0/24", availability_zone = "us-east-1a", map_public_ip_on_launch = true }]
}

variable "security_group" {
  description = "security group definition"
  default     = [{ name = "module_security_group" }]
}

variable "route_table" {
  description = "route table definition"
  default     = [{ name = "module_route_table", cidr_block = "0.0.0.0/0", ipv6_cidr_block = "::/0" }]
}

variable "network_interface" {
  description = "network interface definition"
  default     = [{ name = "module_network_interface", private_ips = ["10.0.1.50"], device_index = 0 }]
}

variable "proj_prefix" {
    description = "prefix included in all the resource names"
    default     = "terraform"
}

