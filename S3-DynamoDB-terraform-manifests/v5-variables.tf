# Input Variables - Placeholder file
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
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
variable "s3_bucket" {
  description = "Name of S3 Bucket"
  type        = string
}
# DynamoDB Variable
variable "dynamodb_table" {
  description = "Name of dynamoDB table"
  type        = string
}
# Business Division
variable "project" {
  description = "Project Name"
  type        = string
}
# AWS Key Pair
variable "aws_key_pair" {
  description = "AWS Key Pair name"
  type        = string
}