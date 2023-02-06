# ---------------------
#
# Setup Lambdas
#
# ---------------------

###
# Dummy source for tha lambda creation
###
data "archive_file" "lambda_source_zip" {
   type        = "zip"
   output_path = "${path.module}/_lambda_source.zip"

   source {
      content  = "hello world"
      filename = "dummy.txt"
   }
}


###
# Upload source zip to S3
###
resource "aws_s3_bucket_object" "s3_lambda_source_zip" {
   bucket    = aws_s3_bucket.s3_bucket_lambda_source.id
   key       = var.lambda_source_s3_key
   source    = data.archive_file.lambda_source_zip.output_path
   tags      = merge(
                  var.aws_resource_tags, 
                  var.lambda_function_tags,
                  tomap({"environment" = var.aws_environment}))
}


###
# Lambda definition
###
resource "aws_lambda_function" "lambda_function" {
   function_name    = var.lambda_function_name
   description      = var.lambda_function_desc
   role             = aws_iam_role.lambda_role.arn
   handler          = var.lambda_function_handler
   runtime          = var.lambda_function_runtime
   memory_size      = var.lambda_function_memory
   timeout          = var.lambda_function_timeout
   s3_bucket        = aws_s3_bucket.s3_bucket_lambda_source.id
   s3_key           = aws_s3_bucket_object.s3_lambda_source_zip.key
   tags             = merge(
                       var.aws_resource_tags, 
                       var.lambda_function_tags,
                       tomap({"environment" = var.aws_environment}))

   dynamic "environment" {
      for_each = length(keys(var.lambda_function_vars)) == 0 ? [] : [true]
      content {
         variables = var.lambda_function_vars
      }
   }
}


###
# CloudWatch logs definition for lambda
###
resource "aws_cloudwatch_log_group" "lambda_cloudwatch_log_group" {
   name              = "/aws/lambda/${aws_lambda_function.lambda_function.function_name}"
   retention_in_days = var.cloudwatch_log_retention
   tags              = merge(
                        var.aws_resource_tags, 
                        var.lambda_function_tags,
                        tomap({"environment" = var.aws_environment}))
}
