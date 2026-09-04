#AWS EC2 instance outputs

output "ec2_instanc_public_instance_id" {
    description = "List of IDs of Instances"
    value = module.ec2-instance.id
  
}

output "ec2_bastion_eip" {
    description = "Elastic IP of Ec2 bastion instance"
    value = aws_eip.bastion_eip
  
}
