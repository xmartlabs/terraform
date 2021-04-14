# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Project = "not created", State = "not created" }]
}

# Networking

variable "device_index_network_interface" {
  description = "network interface definition"
  default     = "0"
}

variable "id_network_interface" {
  description = "network interface definition"
}

# EC2
variable "ec2name" {
  description = "name for the EC2 instance"
  default     = "default-ec2name"
}
variable "key_name" {
  description = "key to be used by the EC2"
  default     = "default-key_name"
}
variable "size" {
  description = "instance type for the EC2"
  default     = "t2.micro"
}
variable "root_disk" {
  description = "root disk definition"
  default     = [{ volume_size = "100", volume_type = "gp2" }]
}
variable "amiid" {
  description = "amazon-linux"
}

# To be run after creation
variable "user_data_path" {
  description = "User data file path"
}