#Data source

data "aws_ec2_instance_type_offerings" "my_instance_type2" {
for_each = toset([ "us-east-1a","us-east-1b","us-east-1e"]) #with foreach alwas use either toset or tomap

  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


#Output1

output "output_v2_1" {

    #value = data.aws_ec2_instance_type_offerings.my_instance_type1.instance_types
    value = [ for e in data.aws_ec2_instance_type_offerings.my_instance_type2: e.instance_types]
  
}

#output with map

output "output_v2_2" {

    value = { for az, details in data.aws_ec2_instance_type_offerings.my_instance_type2: az  => details.instance_types}
  
}
