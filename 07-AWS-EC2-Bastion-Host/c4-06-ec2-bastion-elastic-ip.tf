
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

 #for_each = toset(data.aws_availability_zones.my_azs.names) #convert the data value from list using toset as for each does not accept list it accepts either map or list of strings
 for_each = toset(keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_instance_type: az => details.instance_types
    if length(details.instance_types) != 0  
  
}))
 
 availability_zone = each.key
 
 
 
 tags = {
   "Name" = "Dummy Ec2-${each.key}"
 }

}
