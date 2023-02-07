# ---------------------
#
# Setup S3 Buckets
#
# ---------------------

###
# S3 Bucket for Lambda source
###
resource "aws_s3_bucket" "s3_bucket_lambda_source" {
  bucket    = var.lambda_source_s3_bucket_name
  tags      = var.aws_resource_tags
}


###
# Restrict public access to the bucket
###
resource "aws_s3_bucket_public_access_block" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket_lambda_source.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}