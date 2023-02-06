# ----------------------
#
# AWS Terraform Outputs
#
# ----------------------

###
# API Gateway
###
output "api_gateway_definition_name" {
  description = "Name of the API Gateway"
  value       = aws_api_gateway_rest_api.api_gateway.name
}

output "api_gateway_definition_arn" {
  description = "ARN of the API Gateway"
  value       = aws_api_gateway_rest_api.api_gateway.arn
}

output "api_gateway_stage_url" {
  description = "URL of the API Gateway Stage Deployment"
  value       = aws_api_gateway_stage.api_gateway_stage.invoke_url
}


###
# CloudWatch Log Groups
###
output "cloudwatch_name_api_gateway" {
  description = "Name of the API Gateway CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.api_gateway_cloudwatch_log_group.name
}

output "cloudwatch_arn_api_gateway" {
  description = "ARN of the API Gateway CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.api_gateway_cloudwatch_log_group.arn
}

output "cloudwatch_name_lambda" {
  description = "Name of the Lambda CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.lambda_cloudwatch_log_group.name
}

output "cloudwatch_arn_lambda" {
  description = "ARN of the Lambda CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.lambda_cloudwatch_log_group.arn
}


###
# Dynamo DB
###
output "dynamodb_table_name" {
  description = "Name of the Dynamo DB table"
  value       = aws_dynamodb_table.dynamodb_intents_table.name
}

output "dynamodb_table_arn" {
  description = "ARN of the Dynamo DB table"
  value       = aws_dynamodb_table.dynamodb_intents_table.arn
}


###
# IAM Policies
###
output "policy_name_cloudwatch_log_group_create_permission" {
  description = "Name of the policy granting create permissions for CloudWatch log groups"
  value       = aws_iam_policy.cloudwatch_log_group_create_policy.name
}

output "policy_arn_cloudwatch_log_group_create_permission" {
  description = "ARN of the policy granting read permissions for CloudWatch log groups"
  value       = aws_iam_policy.cloudwatch_log_group_create_policy.arn
}

output "policy_name_api_gway_cloudwatch_log_modify_permission" {
  description = "Name of the policy granting modify permissions for CloudWatch logs for API Gateway"
  value       = aws_iam_policy.cloudwatch_log_api_gateway_modify_policy.name
}

output "policy_arn_api_gway_cloudwatch_log_modify_permission" {
  description = "ARN of the policy granting read permissions for CloudWatch logs for API Gateway"
  value       = aws_iam_policy.cloudwatch_log_api_gateway_modify_policy.arn
}

output "policy_name_lambda_cloudwatch_log_modify_permission" {
  description = "Name of the policy granting modify permissions for CloudWatch logs for Lambda"
  value       = aws_iam_policy.cloudwatch_log_lambda_modify_policy.name
}

output "policy_arn_lambda_cloudwatch_log_modify_permission" {
  description = "ARN of the policy granting read permissions for CloudWatch logs for Lambda"
  value       = aws_iam_policy.cloudwatch_log_lambda_modify_policy.arn
}

output "policy_name_dynamodb_table_read_permission" {
  description = "Name of the policy granting read permissions for the Dynamo DB table"
  value       = aws_iam_policy.dynamodb_table_read_policy.name
}

output "policy_arn_dynamodb_table_read_permission" {
  description = "ARN of the policy granting read permissions for the Dynamo DB table"
  value       = aws_iam_policy.dynamodb_table_read_policy.arn
}


###
# IAM Roles
###
output "role_name_api_gateway" {
  description = "Name of the role for API Gateway"
  value       = aws_iam_role.api_gateway_role.name
}

output "role_arn_api_gateway" {
  description = "ARN of the role for API Gateway"
  value       = aws_iam_role.api_gateway_role.arn
}

output "role_name_lambda" {
  description = "Name of the role for Lambda"
  value       = aws_iam_role.lambda_role.name
}

output "role_arn_lambda" {
  description = "ARN of the role for Lambda"
  value       = aws_iam_role.lambda_role.arn
}


###
# Lambda
###
output "lambda_name" {
  description = "Name of the lambda"
  value       = aws_lambda_function.lambda_function.function_name
}

output "lambda_arn" {
  description = "ARN of the lambda"
  value       = aws_lambda_function.lambda_function.arn
}


###
# S3 Bucket
###
output "s3_bucket_name_lambda_source" {
  description = "Name of the S3 Bucket used for Lambda source code"
  value       = aws_s3_bucket.s3_bucket_lambda_source.bucket
}

output "s3_bucket_arn_lambda_source" {
  description = "ARN of the S3 Bucket used for Lambda source code"
  value       = aws_s3_bucket.s3_bucket_lambda_source.arn
}
