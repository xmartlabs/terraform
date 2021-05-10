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

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket[0].bucket
  acl    = var.bucket[0].acl
  
  tags = {
    Name = var.tags[0].Name
    Project = var.tags[0].Project
    State = var.tags[0].State
  }
  cors_rule {
    allowed_methods = var.cors_rule[0].allowed_methods
    allowed_origins = var.cors_rule[0].allowed_origins
  }
}
