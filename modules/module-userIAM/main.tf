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

resource "aws_iam_user" "user" {
    name = var.user[0].name
    tags = {
        Name = var.user[0].name
        Project = var.tags[0].Project
        State = var.tags[0].State
    }
}

resource "aws_iam_access_key" "userak" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "policy" {
    name        = var.policy[0].name

    user = aws_iam_user.user.name

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
        "Effect": var.policy[1].Effect,
        "Action": var.policy[1].Action,
        "Resource": var.policy[1].Resource
        },
    ]
    })

}

