resource "aws_s3_bucket" "terraform-tfstates-log" {
  bucket  = var.s3_log
  acl     = "log-delivery-write"

  tags = {
    Name        = var.s3_log
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "terraform-tfstates-mgmt" {
  bucket  = var.s3_mgmt
  acl     = "private"

  logging {
    target_bucket = aws_s3_bucket.terraform-tfstates-log.id
    target_prefix = "log/"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = var.s3_mgmt
    Environment = var.environment
  }
}