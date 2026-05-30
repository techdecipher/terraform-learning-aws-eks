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
