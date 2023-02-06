# ----------------------------
#
# Default AWS variable values
#
# ----------------------------

###
# AWS general variables
###
aws_environment     = "DEV"
aws_region          = "ap-southeast-2"
aws_resource_tags   = {
    "application" = "CorpAssist"
    "owner"       = "wonboyn@gmail.com"
    "provisioner" = "terraform"
}


###
# API gateway variables
###
api_gateway_cloudwatch_log_retention = "14"
api_gateway_endpoint_type            = "REGIONAL"
api_gateway_name                     = "CorpAssist"
api_gateway_desc                     = "CorpAssist API Gateway"


###
# Dynamo DB variables
###
dynamodb_table_name = "intents"


###
# Lambda variables
###
cloudwatch_log_retention     = "14"
lambda_function_desc         = "CorpAssist Lambda"
lambda_function_handler      = "lambda_function.lambda_handler"
lambda_function_memory       = "128"
lambda_function_name         = "CorpAssist"
lambda_function_timeout      = "20"
lambda_source_s3_bucket_name = "fred123lambdas"
lambda_source_s3_key         = "rootbot/rootbot.zip"