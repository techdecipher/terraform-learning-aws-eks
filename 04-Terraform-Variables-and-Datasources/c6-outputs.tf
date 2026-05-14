# Output block to show the output of EC2 instance once it is ready


// EC2 public IP

output "instance_publicip" {
    description = "EC2 instance public IP"
    value = aws_instance.my_ec2_instance.public_ip  //value is coming from the ec2 instance reource block and 
    //to get it we generally do resource-block-name.its-logical-name.keeep what you want
    
}

// EC2 DNS

output "instance_publicdns" {
    description = "EC2 instance public DNS"
    value = aws_instance.my_ec2_instance.public_dns  
    
}