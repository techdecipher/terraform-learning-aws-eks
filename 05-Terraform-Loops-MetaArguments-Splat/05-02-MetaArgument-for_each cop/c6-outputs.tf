# Output block to show the output of EC2 instance once it is ready

/*
#output using for loops with list

output "for_output_list" {

    description = "For Loop with list"
    value = [ 
        for instance in aws_instance.my_ec2_instance : 
        instance.public_dns
     ]
  
}

#output using for loops with map1

output "for_output_map1" {
    description = "For Loop with map1"
    value = { 
        for instance in aws_instance.my_ec2_instance : 
        instance.id => instance.public_dns   
    }
  
}

#output using for loops with map2

output "for_output_map2" {
    description = "For Loop with map2 Advanced"
    value = { 
        for c, instance in aws_instance.my_ec2_instance : 
        instance.id => instance.public_dns   
    }
  
}

*/

/*
#output using with legacy splat operator

output "legacy_splat_operator" {
    description = "Output using legacy splat operator"
    value = aws_instance.my_ec2_instance.*.public_dns
  
}

*/


#output using with ToSet for public DNS

output "Public_ip" {
    description = "EC2 public IP"
   # value = aws_instance.my_ec2_instance[*].public_dns  #plan failed here because we are using for each in main instance and for each only accepts list of string or map so we need to convert the output to list of strings which we can easily do it with the for loop
    value = [for instance in aws_instance.my_ec2_instance : instance.public_ip]
}


#output using with ToSet for public DNS

output "pubic_dns" {
    description = "EC2 public DNS"
   # value = aws_instance.my_ec2_instance[*].public_dns  #plan failed here because we are using for each in main instance and for each only accepts list of string or map so we need to convert the output to list of strings which we can easily do it with the for loop
    value = [for instance in aws_instance.my_ec2_instance : instance.public_dns]
}


#output using with map 

output "pubic_dns_with_map" {
    description = "EC2 public DNS with map"
    value = { for az, instance in aws_instance.my_ec2_instance : az => instance.public_dns }
}

