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
# Lambda variables
###
variable "lambda" {
  description = "The lambda functions that are required"
  type        = map(object({
                    description = string
                    handler     = string
                    memory      = number
                    runtime     = string
                    source      = string
                    tags        = map(string)
                    timeout     = number
                    vars        = map(string)
                }))
}
