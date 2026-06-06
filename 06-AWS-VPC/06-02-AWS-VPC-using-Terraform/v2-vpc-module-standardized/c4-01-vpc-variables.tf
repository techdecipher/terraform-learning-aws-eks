
# VPC name

variable "vpc_name" {
    description = "VPC Name"
    type = string
    default = "my_vpc"
  
}

# VPC CIDR Block

variable "vpc_cidr_block" {
    description = "VPC CIDR Block"
    type = string
    default = "10.0.0.0/16"
  
}

# VPC AZs

variable "vpc_availability_zone" {
    description = "VPC Avaialability Zone"
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
  
}

# VPC public subnet

variable "vpc_public_subnet" {
    description = "VPC Public Subnet"
    type = list(string)
    default = ["10.0.101.0/24", "10.0.102.0/24"]
  
}

# VPC public subnet

variable "vpc_private_subnet" {
    description = "VPC Private Subnet"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
  
}

# VPC database subnet

variable "vpc_db_subnet" {
    description = "VPC Database Subnet"
    type = list(string)
    default = ["10.0.151.0/24", "10.0.152.0/24"]
  
}

# VPC Create DB subnet Group ( True / False )

variable "vpc_create_database_subnet_group" {
    description = "VPC Create Database Subnet Group"
    type = bool
    default = true
  
}

# VPC DB Subnet route table

variable "vpc_create_database_subnet_route_table" {
    description = "VPC Create Database Subnet Route Table"
    type = bool
    default = true
  
}

# VPC DNS params ( True / False )

variable "vpc_enable_dns_hostnames" {
    description = "VPC enable dns hostnames"
    type = bool
    default = true
  
}

# VPC DNS params ( True / False )

variable "vpc_enable_dns_support" {
    description = "VPC enable dns support"
    type = bool
    default = true
  
}

# VPC NAT gateway ( True / False )

variable "vpc_enable_nat_gateway" {
    description = "VPC enable nat gateway"
    type = bool
    default = true
  
}

# VPC NAT gateway ( True / False )

variable "vpc_single_nat_gateway" {
    description = "VPC single nat gateway"
    type = bool
    default = true
  
}