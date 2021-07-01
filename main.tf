terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY #the IAM Access Key
  secret_key = var.AWS_SECRET_KEY #the IAM Secret key
  region     = var.AWS_REGION     #the AWS Region
}

module "VPC" {
  source = "./Modules/VPC"
}
