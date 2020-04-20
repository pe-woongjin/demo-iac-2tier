resource "aws_s3_bucket" "s3-logs" {
  bucket  = "${var.resrc_prefix_nm}-s3-logs"
  acl     = "log-delivery-write"

  tags = {
    Name        = "${var.resrc_prefix_nm}-s3-logs"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "s3-state" {
  bucket  = "${var.resrc_prefix_nm}-s3-state"
  acl     = "private"

  logging {
    target_bucket = aws_s3_bucket.s3-logs.id
    target_prefix = "log/"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "${var.resrc_prefix_nm}-s3-state"
    Environment = var.environment
  }
}