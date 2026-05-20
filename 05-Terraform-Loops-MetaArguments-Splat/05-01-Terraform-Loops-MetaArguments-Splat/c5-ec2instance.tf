
#resource block EC2 instance

resource "aws_instance" "my_ec2_instance" {
 ami = data.aws_ami.amazon_linux_3.id //dynamically put it since we have data source block in c4-ami-datasource
 
 #instance_type = var.instance_type

 #using instance type list from variables
 #instance_type = var.instance_type_list[1] #1 is nothing but the the values at 1st number in list
 
 #using instance type maps from variables
 instance_type = var.instance_type_map["qa"] #for specific envs map
 user_data = file("${path.module}/web_app.sh")
 key_name = var.instance_keypair  //key name put into variables
 vpc_security_group_ids = [ aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id ] // has to be like that for multiple sg groups
 count = 2
 tags = {
   "Name" = "Dummy Ec2-${count.index}"
 }

}
