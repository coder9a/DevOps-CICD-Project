terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-eks-s3-bucket"
    key            = "dev/eks-cluster/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-dynamodb-lock-table"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
