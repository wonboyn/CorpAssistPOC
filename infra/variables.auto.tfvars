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
# Lambda variables
###
lambda = {
    namesearch = {
        description = "Business Name Search"
        handler     = "lambda_function.lambda_handler"
        memory      = 128
        runtime     = "python3.9"
        source      = "../services/src/businessName/lambda_function.py"
        timeout     = 10
        tags        = {}
        vars        = {}
    },
    router = {
        description = "CorpAssist Router"
        handler     = "lambda_function.lambda_handler"
        memory      = 128
        runtime     = "python3.9"
        source      = "../services/src/router/lambda_function.py"
        timeout     = 5
        tags        = {}
        vars        = { fred = "namesearch" }
    }
}
