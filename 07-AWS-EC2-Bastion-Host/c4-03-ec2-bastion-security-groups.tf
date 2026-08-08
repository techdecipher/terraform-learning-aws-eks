#SG module

module "public_bastion_SG" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.7.0"
  name        = "${local.name}-public_bastion_SG"
  description = "security group for Bastion SG SSH port open for all ips"
  vpc_id      = module.vpc.vpc_id

#Ingress Rules and CICR block

  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

#Egress Rules and CICR block

  egress_rules = ["all-all"]
  tags = local.common_tags
}