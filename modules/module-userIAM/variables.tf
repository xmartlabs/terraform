# Generics
variable "region" {
  description = "required - region"
  default = "us-east-1"
}

variable "tags" {
  description = "required - default important tags for resources"
  default     = [{ Project = "not created", State = "not created" }]
}

# IAM user

variable "user" {
  description = ""
  default     = [{ name= "test-devops-user" }]
}

variable "goup" {
  description = ""
  default     = [{ name= "test-devops-group" }]
}

variable "policy" {
  description = ""
  default     = [{ name= "test-devops-group"},{Effect = "Allow", Action = "s3:PutObject",Resource= "arn:aws:s3:::testputobject-devops/*"}]
}