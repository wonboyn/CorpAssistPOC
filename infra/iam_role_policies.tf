# -------------------------------------
#
# Setup attachment of policies to roles
#
# -------------------------------------

###
# API Gateway role policy attachment
###
resource "aws_iam_role_policy_attachment" "api_gateway_role_policy1" {
  role       = aws_iam_role.api_gateway_role.name
  policy_arn = aws_iam_policy.cloudwatch_log_group_create_policy.arn
}

resource "aws_iam_role_policy_attachment" "api_gateway_role_policy2" {
  role       = aws_iam_role.api_gateway_role.name
  policy_arn = aws_iam_policy.cloudwatch_log_api_gateway_modify_policy.arn
}


###
# Lambda role policy attachment
###
resource "aws_iam_role_policy_attachment" "lambda_role_policy1" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.cloudwatch_log_group_create_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy2" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.cloudwatch_log_lambda_modify_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy3" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dynamodb_table_read_policy.arn
}