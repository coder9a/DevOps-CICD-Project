# Define Local Values in Terraform
locals {
  common_tags = {
    owners = var.project
    environment    = var.environment
  }
}
