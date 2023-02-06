# ------------------
#
# Setup IAM Roles
#
# ------------------

###
# Role for API Gateway REST Endpoint
###
resource "aws_iam_role" "api_gateway_role" {
   name = "CorpAssist_API_Gateway_Role"
   tags = var.aws_resource_tags
   assume_role_policy = <<EOF
{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Action": "sts:AssumeRole",
         "Principal": {
           "Service": [
             "apigateway.amazonaws.com"
           ]
         }
       }
     ]
}
EOF
}


###
# Role for Lambda
###
resource "aws_iam_role" "lambda_role" {
   name = "CorpAssist_Lambda_Role"
   tags = var.aws_resource_tags
   assume_role_policy = <<EOF
{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Action": "sts:AssumeRole",
         "Principal": {
           "Service": [
             "lambda.amazonaws.com"
           ]
         }
       }
     ]
}
EOF
}
