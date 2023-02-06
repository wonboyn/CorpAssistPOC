# ------------------------
#
# AWS Terraform Variables
#
# ------------------------

###
# AWS general variables
###
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_environment" {
  description = "AWS environment/stage [DEV/TEST/PROD]"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_resource_tags" {
  description = "Common Resource Tags"
  type        = map(string)
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}


###
# API gateway variables
###
variable "api_gateway_cloudwatch_log_retention" {
  description = "The API Gateway log retention period"
  type        = number
}

variable "api_gateway_endpoint_type" {
  description = "The API Gateway REST endpoint type (Edge or Regional)"
  type        = string
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_gateway_desc" {
  description = "The description for the API Gateway"
  type        = string
}

variable "api_gateway_tags" {
  description = "Tags to apply to the API Gateway"
  type        = map(string)
  default     = {}
}


###
# Dynamo DB variables
###
variable "dynamodb_table_name" {
  description = "Name of the intents table in Dynamo DB"
  type        = string
}

variable "dynamodb_table_tags" {
  description = "Tags to apply to the intents table"
  type        = map(string)
  default     = {}
}


###
# Lambda variables
###
variable "cloudwatch_log_retention" {
  description = "The retention period for the lambda function logs"
  type        = number
}

variable "lambda_function_desc" {
  description = "The description for the lambda function"
  type        = string
}

variable "lambda_function_handler" {
  description = "The service handler path for the lambda function"
  type        = string
}

variable "lambda_function_memory" {
   description = "The memory limit for the lambda function"
   type        = number
}

variable "lambda_function_name" {
   description = "The name for the lambda function"
   type        = string
}

variable "lambda_function_runtime" {
   description = "The runtime type for the lambda function"
   type        = string
   default     = "python3.9"
}

variable "lambda_function_tags" {
   description = "Tags to apply to the lambda function"
   type        = map(string)
   default     = {}
}

variable "lambda_function_timeout" {
   description = "The timeout for the lambda function"
   type        = number
}

variable "lambda_function_vars" {
   description = "Environment variables to apply to the lambda function"
   type        = map(string)
   default     = {}
}

variable "lambda_source_s3_bucket_name" {
   description = "The name of the S3 bucket that has the lambda source zip"
   type        = string
}

variable "lambda_source_s3_key" {
   description = "The name of the S3 bucket key that has the lambda source zip"
   type        = string
}