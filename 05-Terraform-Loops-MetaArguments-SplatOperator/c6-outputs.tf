# Output block to show the output of EC2 instance once it is ready

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

#output using with legacy splat operator

output "legacy_splat_operator" {
    description = "Output using legacy splat operator"
    value = aws_instance.my_ec2_instance.*.public_dns
  
}

#output using with latest splat operator

output "latest_splat_operator" {
    description = "Output using latest splat operator"
    value = aws_instance.my_ec2_instance[*].public_dns
  
}






