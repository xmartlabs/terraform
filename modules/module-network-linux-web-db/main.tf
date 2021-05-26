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

resource "aws_vpc" "vpc" {
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
#Public
resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_prefix_public[0].cidr_block
  availability_zone       = var.subnet_prefix_public[0].availability_zone
  map_public_ip_on_launch = var.subnet_prefix_public[0].map_public_ip_on_launch
  tags = {
    Name = var.subnet_prefix_pubic[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
    }
}

#Private subnet 1
resource "aws_subnet" "subnet-2"{
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_prefix_private_1[0].cidr_block
  availability_zone       = var.subnet_prefix_private_1[0].availability_zone
  map_public_ip_on_launch = var.subnet_prefix_private_1[0].map_public_ip_on_launch
  tags = {
    Name = var.subnet_prefix_private_1[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
    }
}

#Private subnet 2
resource "aws_subnet" "subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_prefix_private_2[0].cidr_block
  availability_zone       = var.subnet_prefix_private_2[0].availability_zone
  map_public_ip_on_launch = var.subnet_prefix_private_2[0].map_public_ip_on_launch
  tags = {
    Name = var.subnet_prefix_private_2[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
    }
}


resource "aws_security_group" "security_group_web" {
  name        = var.security_group_web[0].name
  vpc_id      = aws_vpc.vpc.id
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
    Name = var.security_group_web[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
  }
}

resource "aws_security_group" "security_group_db" {
  name        = var.security_group_db[0].name
  vpc_id      = aws_vpc.vpc.id
  
  ingress {
      from_port   = var.security_group_db[0].dbport
      to_port     = var.security_group_db[0].dbport
      protocol    = "tcp"
      cidr_blocks = [var.vpc[0].cidr_block]
  }
  tags = {
    Name = var.security_group_db[0].name
    Project = var.tags[0].Project
    State = var.tags[0].State
  }
}


resource "aws_internet_gateway" "igw" {
   vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route_table" {
   vpc_id = aws_vpc.vpc.id
   route {
     cidr_block = var.route_table[0].cidr_block
     gateway_id = aws_internet_gateway.igw.id
   }
   route {
     ipv6_cidr_block = var.route_table[0].ipv6_cidr_block
     gateway_id      = aws_internet_gateway.igw.id
   }
   tags = {
        Name = var.route_table[0].name
        Project = var.tags[0].Project
        State = var.tags[0].State
    }
}

resource "aws_route_table_association" "a" {
   subnet_id      = aws_subnet.subnet-1.id
   route_table_id = aws_route_table.route_table.id
 }

resource "aws_network_interface" "network_interface" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = var.network_interface[0].private_ips
  security_groups = [aws_security_group.security_group_web.id]
  tags = {
        Name = var.network_interface[0].name
        Project = var.tags[0].Project
        State = var.tags[0].State
  }
}