# ------------------
#
# Setup IAM Policies
#
# ------------------

###
# Policy granting permission to read the Dynamo DB Intents table
###
data "aws_iam_policy_document" "dynamodb_read_policy_doc" {
  statement {
    actions = [
       "dynamodb:DescribeTable",
       "dynamodb:GetItem",
       "dynamodb:Scan",
       "dynamodb:Query"
    ]
    resources = [
        aws_dynamodb_table.dynamodb_intents_table.arn
    ]
  }
}

resource "aws_iam_policy" "dynamodb_table_read_policy" {
  name        = "CorpAssist_DynamoDB_Table_Read_Policy"
  description = "Policy granting read access to Dynamo DB table"
  policy      = data.aws_iam_policy_document.dynamodb_read_policy_doc.json
}


###
# Policy granting permission to create log groups
###
data "aws_iam_policy_document" "cloudwatch_loggroup_policy_doc" {
  statement {
    actions = [
       "logs:CreateLogGroup"
    ]
    resources = [
        "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:*"
    ]
  }
}

resource "aws_iam_policy" "cloudwatch_log_group_create_policy" {
  name        = "CorpAssist_LogGroup_Create_Policy"
  description = "Policy granting create access for CloudWatch Log Groups"
  policy      = data.aws_iam_policy_document.cloudwatch_loggroup_policy_doc.json
}


###
# Policy granting permission to modify CloudWatch logs to API Gateway
###
data "aws_iam_policy_document" "api_gateway_log_policy_doc" {
  statement {
    actions = [
       "logs:CreateLogStream",
       "logs:DescribeLogGroups",
       "logs:DescribeLogStreams",
       "logs:GetLogEvents",
       "logs:FilterLogEvents",
       "logs:PutLogEvents"
    ]
    resources = [ "*" ]
  }
}

resource "aws_iam_policy" "cloudwatch_log_api_gateway_modify_policy" {
  name        = "CorpAssist_Modify_APIGateway_Log_Policy"
  description = "Policy granting modify access for API Gateway CloudWatch Logs"
  policy      = data.aws_iam_policy_document.api_gateway_log_policy_doc.json
}


###
# Policy granting permission to modify CloudWatch logs to Lambda 
###
data "aws_iam_policy_document" "lambda_log_policy_doc" {
  statement {
    actions = [
       "logs:CreateLogStream",
       "logs:PutLogEvents"
    ]
    resources = [
        aws_cloudwatch_log_group.lambda_cloudwatch_log_group.arn
    ]
  }
}

resource "aws_iam_policy" "cloudwatch_log_lambda_modify_policy" {
  name        = "CorpAssist_Modify_Log_Policy"
  description = "Policy granting modify access for Lambda CloudWatch Logs"
  policy      = data.aws_iam_policy_document.lambda_log_policy_doc.json
}
