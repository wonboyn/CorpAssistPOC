# ----------------------
#
# Setup API Gateway
#
# ----------------------

###
# API Gateway Definition
###
resource "aws_api_gateway_rest_api" "api_gateway" {
  name          = var.api_gateway_name
  description   = var.api_gateway_desc
  body          = templatefile("api_gateway_swagger.yaml", { ProcessMessage = module.lambda_function["router"].lambda_function_invoke_arn })
  endpoint_configuration {
    types = [var.api_gateway_endpoint_type] 
  }
}


###
# API Gateway CloudWatch logs definition
###
resource "aws_cloudwatch_log_group" "api_gateway_cloudwatch_log_group" {
   name              = "/aws/apigateway/${aws_api_gateway_rest_api.api_gateway.name}"
   retention_in_days = var.api_gateway_cloudwatch_log_retention
   tags              = merge(
                        var.aws_resource_tags, 
                        var.api_gateway_tags,
                        tomap({"environment" = var.aws_environment}))
}


###
# API Gateway CloudWatch ARN
###
resource "aws_api_gateway_account" "api_gateway_account" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_role.arn
}


###
# API Gateway Deployment
###
resource "aws_api_gateway_deployment" "api_gateway_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  description = "Terraform deployment"
}


###
# API Gateway Stage
###
resource "aws_api_gateway_stage" "api_gateway_stage" {
  deployment_id = aws_api_gateway_deployment.api_gateway_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  stage_name    = var.aws_environment
}
