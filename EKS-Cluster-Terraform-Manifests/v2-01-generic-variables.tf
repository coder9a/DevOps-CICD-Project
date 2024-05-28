# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}
variable "aws_access_key" {
  type        = string
  description = "Access key of AWS account"
  default     = ""
}

variable "aws_secret_key" {
  type        = string
  description = "secret key of AWS account"
  default     = ""
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "SAP"
}
