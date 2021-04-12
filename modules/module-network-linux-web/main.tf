terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc[0].cidr_block
  instance_tenancy = var.vpc[0].instance_tenancy
  enable_dns_hostnames = var.vpc[0].enable_dns_hostnames
  enable_dns_support = var.vpc[0].enable_dns_support
  tags = {
    Name = var.vpc[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
   }
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_prefix[0].cidr_block
  availability_zone       = var.subnet_prefix[0].availability_zone
  map_public_ip_on_launch = var.subnet_prefix[0].map_public_ip_on_launch
  tags = {
    Name = var.subnet_prefix[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
    }
}

resource "aws_security_group" "main_security_group" {
  name        = var.security_group[0].name
  vpc_id      = aws_vpc.main_vpc.id
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.security_group[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
    }
}

resource "aws_internet_gateway" "main_igw" {
   vpc_id = aws_vpc.main_vpc.id
 }

resource "aws_route_table" "main_route_table" {
   vpc_id = aws_vpc.main_vpc.id
   route {
     cidr_block = var.route_table[0].cidr_block
     gateway_id = aws_internet_gateway.main_igw.id
   }
   route {
     ipv6_cidr_block = var.route_table[0].ipv6_cidr_block
     gateway_id      = aws_internet_gateway.main_igw.id
   }
   tags = {
        Name = var.route_table[0].name
        Project = var.tags[0].Project
        State = var.tags[0].State
    }
}

resource "aws_route_table_association" "a" {
   subnet_id      = aws_subnet.subnet-1.id
   route_table_id = aws_route_table.main_route_table.id
 }

resource "aws_network_interface" "main_network_interface" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = var.network_interface[0].private_ips
  security_groups = [aws_security_group.main_security_group.id]
  tags = {
        Name = var.network_interface[0].name
        Project = var.tags[0].Project
        State = var.tags[0].State
  }
}

data "aws_network_interface" "id_network_interface" {
  id = aws_network_interface.main_network_interface.id 
}
