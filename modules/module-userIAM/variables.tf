# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Project = "not created", State = "not created" }]
}

# IAM user

variable "user" {
  description = "variables-user"
  default     = [{ name= "terraform-user" }]
}

#This policy give permission of put objects in a bucket s3
variable "policy" {
  description = "variable-policy"
  default     = [{ name= "terraform-policy"},{Effect = "Allow", Action = "s3:PutObject",Resource= "arn for your resource e.g. S3"}]
}