
# null resource to connect to the bastion host basically establishing a connection to the bastion host 
resource "null_resource" "copy_ec2_key" {
  depends_on = [module.ec2-instance] // to ensure that the EC2 instance is created before copying the key
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ec2-user"
    password = ""
    private_key = file(private_key/terraform-aws-ec2-bastion.pem)
  
}

#file provisioner to copy the private key to the bastion host post connection is stablished
provisioner "file" {
    source      = "private_key/terraform-aws-ec2-bastion.pem"
    destination = "/tmp/terraform-aws-ec2-bastion.pem"
  }

  #remote-exec provisioner to change the permission of the private key file on the bastion host
provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-aws-ec2-bastion.pem",
      "sudo chown ec2-user:ec2-user /tmp/terraform-aws-ec2-bastion.pem"
    ]
  }

  # you can  also add local exec when resource is created or destory that is something you want to do on your
  #local machine when the resource is created or destroyed. For example, you can add a local exec to run a script that sets up your local environment for connecting to the bastion host.

}