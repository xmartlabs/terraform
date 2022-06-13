terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2-instance" {
  ami           = var.amiid
  instance_type = var.size
  root_block_device {
    volume_size = var.root_disk[0].volume_size
  #  volume_type = var.root_disk[0].volume_type
  }
  key_name   = var.key_name
  user_data  = templatefile(var.user_data_path, {})
  tags = {
    Name    = var.ec2name
    Project = var.tags[0].Project
    State   = var.tags[0].State
  }
  network_interface {
    device_index = var.device_index_network_interface
    network_interface_id = var.id_network_interface
  }
  iam_instance_profile = var.iam_instance_profile
}