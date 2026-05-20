#Terraform block
terraform {
  required_version = "~> v1.15.1"  // ~> allows right most will not use other version like v1.16xx because currently the right most version is v1.15 at the time of this development
  //~> means version locking

  required_providers {
    aws = {
       # goto https://registry.terraform.io/providers/hashicorp/aws/latest and copy the source and versions 
       source  = "hashicorp/aws"
       version = "6.44.0"
    }

  }

}

#Provider Block

provider "aws" {

    region = var.aws_region 
}
