# Terraform Output Values

##  Introduction

-   Understand about Output Values and implement them
-   Query outputs using  `terraform output`
-   Understand about redacting secure attributes in output values
-   Generate machine-readable output

#after apply we can know output value for senisitive data by giving below command
# refrence 

output "instance_public_ip" {
    value = aws_instance.test.public_ip
    sensitive = true
}

output "instance_id"{
    value = aws_instance.test.id
}
output "instance_public_dns" {
    value = aws_instance.test.public_dns
  
}
output "instance_arn" {
    value = aws_instance.test.arn
  
}

# Terraform Output Commands
terraform output
terraform output ec2_publicdns

 Output Values - Suppressing Sensitive Values in Output

-   We can redact the sensitive outputs using  `sensitve = true`  in output block
-   This will only redact the cli output for terraform plan and apply
-   When you query using  `terraform output`, you will be able to fetch exact values from  `terraform.tfstate`  files
-   Add  `sensitve = true`  for output  `ec2_publicdns`


# Generate machine-readable output
terraform output -json

Step-06: Destroy Resources

# Destroy Resources
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*

References

-   [Terraform Output Values](https://www.terraform.io/docs/language/values/outputs.html)
