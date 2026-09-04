
# Declare the data source
data "aws_availability_zones" "available" {

}


#create VPC module


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

#VPC basic Details

name = var.vpc_name
cidr = var.vpc_cidr_block


azs = data.aws_availability_zones.available.names
private_subnets     = var.vpc_private_subnet
public_subnets      = var.vpc_public_subnet

#enable the "auto-assign public IP" setting
map_public_ip_on_launch = true 
  
#db subnet 
create_database_subnet_group = var.vpc_create_database_subnet_group
create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
database_subnets    = var.vpc_db_subnet

  
#NAT gatway for outbound communication
enable_nat_gateway = var.vpc_enable_nat_gateway
single_nat_gateway = var.vpc_single_nat_gateway

#VPC DNS params
enable_dns_hostnames = var.vpc_enable_dns_hostnames
enable_dns_support = var.vpc_enable_dns_support

#subet tags

public_subnet_tags = {
  Name = "Public Subnets"
}

private_subnet_tags = {
  Name = "Private Subnets"
}

database_subnet_tags = {
  Name = "Database Subnets"
}

#regualr tags

tags = local.common_tags
vpc_tags = local.common_tags

}