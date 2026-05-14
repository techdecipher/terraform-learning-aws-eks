#Input Variables


#aws region variable
variable "aws_region" {

  description = "Region in which AWS resource to be created"
  type = string
  default = "us-east-1"  #default value 
  
}

# ec2 instance type

variable "instance_type" {

  description = "EC2 instance type"
  type = string
  default = "t3.micro"
  
}

# instance key pair

variable "instance_keypair" {

  description = "AWS EC2 key pair"
  type = string
  default = "common"
  
}
