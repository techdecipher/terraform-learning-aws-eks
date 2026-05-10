#resource block EC2 instance

resource "aws_instance" "my_ec2_instance" {
 ami = "ami-098e39bafa7e7303d"
 instance_type = "t3.micro"
 user_data = file("${path.module}/web_app.sh")
 tags = {
   "Name" = "Dummy Ec2"
 }

}