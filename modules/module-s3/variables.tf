# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Name = "not created",Project = "not created", State = "not created" }]
}

#S3

variable "bucket" {
  description = "required - default important variable for s3 resources"
  default     = [{ bucket = "terraform_bucket ", acl = "private" }]
}

