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
    max_age_seconds = var.cors_rule[0].max_age_seconds
  }
}

resource "aws_s3_bucket_policy" "policy-s3" {
  bucket = aws_s3_bucket.bucket.id

  tags = {
    Name = var.tags[0].Name
    Project = var.tags[0].Project
    State = var.tags[0].State
  }
  
  policy = jsonencode({
    Id      = var.id-fe
    Statement = [
      {
        Sid       = var.policy[0].Sid
        Effect    = var.policy[0].Effect
        Principal = var.policy[0].Principal
        Action    = var.action_policy
        Resource = [aws_s3_bucket.bucket.arn,"${aws_s3_bucket.bucket.arn}/*",]
      },
    ]
  })
}