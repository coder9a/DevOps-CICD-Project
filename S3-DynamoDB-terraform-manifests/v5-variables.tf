# Input Variables - Placeholder file
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
# S3 Bucket Name
variable "s3-bucket" {
  description = "Name of S3 Bucket"
  type        = string
  default     = "terraform-eks-s3-bucket"
}
# DynamoDB Variable
variable "dynamodb-table" {
  description = "Name of dynamoDB table"
  type        = string
  default     = "eks-dynamodb-lock-table"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "franciscan"
}
# AWS Key Pair
variable "aws-key-pair" {
  description = "AWS Key Pair name"
  type        = string
  default     = "eks-terraform-key"
}