# ---------------------
#
# Setup Lambdas
#
# ---------------------

module "lambda_function" {
   source        = "terraform-aws-modules/lambda/aws"
   version       = "4.9.0"

   for_each      = var.lambda

   function_name         = each.key
   description           = each.value["description"]
   environment_variables = each.value["vars"]
   handler               = each.value["handler"]
   runtime               = each.value["runtime"]
   memory_size           = each.value["memory"]
   source_path           = each.value["source"]
   tags                  = merge(
                             var.aws_resource_tags,
                             each.value["tags"],
                             tomap({"environment" = var.aws_environment}))
   timeout               = each.value["timeout"]
}
