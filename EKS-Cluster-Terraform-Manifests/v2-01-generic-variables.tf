variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
}
variable "aws_access_key" {
  type        = string
  description = "Access key of AWS account"
}

variable "aws_secret_key" {
  type        = string
  description = "secret key of AWS account"
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "project" {
  description = "Name of Project"
  type        = string
}
