terraform {
    required_version = ">= 0.12"
}


resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
  #force_destroy = "true"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
