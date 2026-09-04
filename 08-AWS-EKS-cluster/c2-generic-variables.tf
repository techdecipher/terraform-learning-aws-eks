variable "aws_region" {
  description = "Region"
  type = string
  default = "us-east-1"
}


# Environment Variable

variable "environment" {

  description = "Environment Variable used as prefix"
  type = string
  default =  "dev"
  
}

# Business Devision

variable "business_division" {

  description = "Business Division in the large organization this infra belongs"
  type = string
  default = "Development"
  
}