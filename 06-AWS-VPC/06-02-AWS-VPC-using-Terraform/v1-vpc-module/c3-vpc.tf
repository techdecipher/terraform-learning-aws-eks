#create VPC module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

#VPC basic Details

name = "vpc-dev"
cidr = "20.10.0.0/16"

  azs                 = ["us-east-1a","us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  #db subnet 
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]

  
  #NAT gatway for outbound communication
  enable_nat_gateway = true
  single_nat_gateway = true

  #VPC DNS params
  enable_dns_hostnames = true
  enable_dns_support = true

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

  tags = {
    Owner = "Pranav"
    Env = "Dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }

}