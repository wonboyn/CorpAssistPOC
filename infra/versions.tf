# --------------------
#
# Terraform Config
#
# --------------------

terraform {

  # Minimum version
  required_version = ">= 0.13.5"

  # Required providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.19"
    }
  }

  # Terraform state
  backend "local" {
    path = "../tfstate/aws.tfstate"
  }
}
