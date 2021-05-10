# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Name = "My bucket",Project = "not created", State = "not created" }]
}

#S3

variable "bucket" {
  description = "required - default important variable for s3 resources"
  default     = [{ bucket = "terraform_bucket ", acl = "private" }]
}

variable "cors_rule" {
  description = "required - default important variable for s3 resources"
  default     = [{allowed_methods = ["PUT","GET"],allowed_origins = ["*"]}]

}

