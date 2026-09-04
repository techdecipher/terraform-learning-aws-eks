# EC2 instance terraform vairables

variable "instance_type" {

    description = "EC2 Instance Type"  
    type = string
    default = "t3.micro"
}



# EC2 instance terraform key
variable "instance_key_pair" {
    description = "Instance key pair"
    type = string
    default = "terraform-common-key"
  
}

