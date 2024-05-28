resource "aws_s3_bucket" "s3-bucket-name" {
  bucket = var.s3_bucket
  tags = {
    Name        = "${var.project}"
    env = "prod"
  }
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-owner" {
  bucket = aws_s3_bucket.s3-bucket-name.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-bucket-owner]

  bucket = aws_s3_bucket.s3-bucket-name.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3-bucket-versioning" {
  bucket = aws_s3_bucket.s3-bucket-name.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_dynamodb_table" "dynamodb-lock-table" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.project}-dynamodb-table"
    env = "dev"
  }
}