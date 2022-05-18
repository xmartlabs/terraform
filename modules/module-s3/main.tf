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

  tags = {
    Name = var.bucket[0].bucket
    Project = var.tags[0].Project
    State = var.tags[0].State
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = var.cors_rule[0].allowed_methods
    allowed_origins = var.cors_rule[0].allowed_origins
    expose_headers  = []
    max_age_seconds = var.cors_rule[0].max_age_seconds
  }
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}