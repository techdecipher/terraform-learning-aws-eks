
#resource block EC2 instance


  module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.0"


  name = "${local.name}-BastionHost"
  ami = data.aws_ami.amazon_linux_3.id
  instance_type = var.instance_type
  key_name      = var.instance_key_pair
  #monitoring    = true
  // refer the output of the security group module to get the security group id
  vpc_security_group_ids = [ module.public_bastion_SG.security_group_id ]
  subnet_id     = module.vpc.public_subnets[0]


  tags = local.common_tags
  }
