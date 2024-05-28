resource "aws_s3_bucket" "s3-bucket-name" {
  bucket = var.s3-bucket
  tags = {
    Name        = "${var.business_divsion}"
    Environment = "prod"
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

resource "aws_s3_object" "directory_structure" {
  count        = length(local.s3_folders)
  bucket       = aws_s3_bucket.s3-bucket-name.id
  key          = local.s3_folders[count.index]
  content_type = "application/x-directory"
}

resource "aws_dynamodb_table" "dynamodb-lock-table" {
  count        = length(local.dynamodb_tables)
  name         = local.dynamodb_tables[count.index]
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.business_divsion}-dynamodb-table"
    Environment = "dev"
  }
}