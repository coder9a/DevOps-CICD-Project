# Define Local Values in Terraform
locals {
  common_tags = {
    owners = var.project
    env    = var.env
  }
}
