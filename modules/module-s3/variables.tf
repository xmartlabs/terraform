# Generics
variable "region" {
  description = "required - region"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Project = "not created", State = "not created" }]
}

#S3

variable "bucket" {
  description = "required - default important variable for s3 resources"
  default     = [{ bucket = "terraform_bucket ", acl = "private" }]
}

variable "cors_rule" {
  description = "required - default important variable for s3 resources"
  default     = [{allowed_methods = ["GET"],allowed_origins = ["*"], max_age_seconds = 3000}]
}

variable "policy" {
  description = "required - default important variable for s3 resources"
   default    = [{Sid="PublicListGet",Effect="Allow",Principal="*"}]
}

variable "action_policy" {
   description = "required - default important variable for s3 resources"
   default    = ["s3:GetObject"]
}