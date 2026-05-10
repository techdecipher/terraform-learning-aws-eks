#Terraform block
terraform {
  required_version = "~> v1.15.1"  // ~> allows right most will not use other version like v1.16xx because currently the right most version is v1.15 at the time of this development
  //~> means version locking

  required_providers {
    aws = {
       # goto https://registry.terraform.io/providers/hashicorp/aws/latest and copy the source and versions 
       source  = "hashicorp/aws"
       version = "~> 6.0"
    }

  }

}

#Provider Block

provider "aws" {

    region = "us_east_1"

    //profile = "default"  we have already configured the aws cli defualt profile it will take from this if we are using other profile, but now I am just using the default profile so i can leave it.
    
    //profile = "dev-account"
  
}
