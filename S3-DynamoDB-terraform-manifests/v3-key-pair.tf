resource "tls_private_key" "dev-rsa-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key-pair" {
  key_name   = var.aws-key-pair
  public_key = tls_private_key.dev-rsa-key.public_key_openssh
}

resource "local_file" "key-pair-path" {
  content         = tls_private_key.dev-rsa-key.private_key_openssh
  filename        = "/workspaces/Terraform-on-AWS-EKS/private-key/${var.aws-key-pair}.pem"
  file_permission = "0400"
}