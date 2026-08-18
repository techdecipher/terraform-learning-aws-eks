
resource "aws_eip" "bastion_eip" {

  depends_on = [module.ec2-instance, module.vpc] // to ensure that the EIP is created after the EC2 instance and VPC is created
  instance =  module.ec2_instance.id //ID of the EC2 instance
  //vpc      = true  older way 
  domain   = "vpc" // newer way to specify that the EIP is for a VPC instance
  tags = local.common_tags
}