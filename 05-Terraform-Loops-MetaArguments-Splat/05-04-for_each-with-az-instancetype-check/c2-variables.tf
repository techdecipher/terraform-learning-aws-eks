#Input Variables


#aws region variable
variable "aws_region" {

  description = "Region in which AWS resource to be created"
  type = string
  default = "us-east-1"  #default value 
  
}

# instance key pair

variable "instance_keypair" {

  description = "AWS EC2 key pair"
  type = string
  default = "common"
  
}

# ec2 instance type as list just for understanding

variable "instance_type_list" {

    description = "Instance type as list"
    type = list(string)
    default = [ "t3.micro", "t3.small" ] # when you refere this in main file you denote as 1 2 and 3
  
}

# ec2 instance type as map just for understanding

variable "instance_type_map" {
    description = "Instance type as map"
    type = map(string)
    default = {
      "dev" = "t3.micro"
      "qa" = "t3.small"
      "prod" = "t3.large"
    }
  
}


