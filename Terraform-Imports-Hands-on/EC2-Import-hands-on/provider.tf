#Terraform block
terraform {
  required_version = "~> v1.15.1" 

  required_providers {
    aws = { 
       source  = "hashicorp/aws"
       version = "6.44.0"
    }
 }
}

#Provider Block

provider "aws" {

    region = var.aws_region 
  
}