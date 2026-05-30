//EC2 instance resource block created via Terraform


resource "aws_instance" "my_ec2_instance" {
 ami = data.aws_ami.amazon_linux_3.id //dynamically put it since we have data source block in c4-ami-datasource
 instance_type = var.instance_type
 key_name = var.instance_keypair  //key name put into variables
 vpc_security_group_ids = [ aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id ] // has to be like that for multiple sg groups

 tags = {
   "Name" = "Dummy Ec2 Created via Terraform"
 }

}


//EC2 instance empty resource block created via Console and I am trying to import it 

resource "aws_instance" "ec2_manual" {
    ami                                  = "ami-091138d0f0d41ff90"
    availability_zone                    = "us-east-1c"
    instance_type                        = "t3.micro"
    key_name                             = "common"
   
    security_groups                      = [
        "EC2-SG",
    ]
    
    subnet_id                            = "subnet-0856e57739674998b"
    tags                                 = {
        "Name" = "EC2 Created From Console "
    }
    tags_all                             = {
        "Name" = "EC2 Created From Console "
    }

}