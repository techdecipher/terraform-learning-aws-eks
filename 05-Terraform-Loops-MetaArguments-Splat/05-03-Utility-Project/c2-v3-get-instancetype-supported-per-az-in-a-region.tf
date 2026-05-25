
#get the list of azs for for each to use 

#Data Source 01

data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}



#Data Source 02
#Data source final version

data "aws_ec2_instance_type_offerings" "my_instance_type" {
for_each = toset(data.aws_availability_zones.my_azs.names)

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


#Output

output "v3_1" {
description = "This is for plain output as V3"
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_instance_type: az => details.instance_types
  }
  
}

output "v3_2" {
description = "This is for plain output as V3"
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_instance_type: az => details.instance_types
    if length(details.instance_types) != 0  # adding a condition, give me the instance type which are not blank its only blank if it matched length 0 it there is output lenght would be more than 0 
  }
  
}


#now we just want the keys means out of 

/*
{
      + us-east-1a = [
          + "t3.micro",
        ]
      + us-east-1b = [
          + "t3.micro",
        ]
      + us-east-1c = [
          + "t3.micro",
        ]
      + us-east-1d = [
          + "t3.micro",
        ]
      + us-east-1f = [
          + "t3.micro",
        ]
    }

*/

#we want the us-east-1d like wise for all, so keys function can do that and thats what we have done

output "v3_3" {
description = "This is for plain output as V3"
  value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_instance_type: az => details.instance_types
    if length(details.instance_types) != 0  
  
})
}

