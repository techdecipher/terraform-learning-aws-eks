#Create SG for allowing SSH 

resource "aws_security_group" "vpc_ssh" {
  name        = "vpc_ssh"
  description = "Allow SSH access"
  #if you dont provide VPC id it will take default VPC okay no issue in that

  ingress {
    description = "Allow port 22 in Inbound Rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  // from wildcard ip range

    /*

    whenever you see the [] square bracket it means list items yo can add as many with , 

    example

    ["0.0.0.0/0", "some other cidr range"]
    */
  }

  egress {
    description = "Outbound Rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


#Create SG for allowing web traffic port 80 and 443

resource "aws_security_group" "vpc_web" {
  name        = "vpc_web"
  description = "Allow web access"

  ingress {
    description = "Allow port 80 in Inbound Rule"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  // from wildcard ip range

  }

#adding second Inbound rule in same security group is by adding one more ingress section like below

  ingress {
    description = "Allow port 443 in Inbound Rule"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "Outbound Rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_traffice"
  }
}