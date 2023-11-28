# Terraform Output Values

## Step-01: Introduction

-   Understand about Output Values and implement them
-   Query outputs using  `terraform output`
-   Understand about redacting secure attributes in output values
-   Generate machine-readable output


# Create Resources
terraform apply -auto-approve

# Access Application
http://<Public-IP>
http://<Public-DNS>

outputs)Step-03: Query Terraform Outputs

-   Terraform will load the project state in state file, so that using  `terraform output`  command we can query the state file.

# Terraform Output Commands
terraform output
terraform output ec2_publicdns

Step-04: Output Values - Suppressing Sensitive Values in Output

-   We can redact the sensitive outputs using  `sensitve = true`  in output block
-   This will only redact the cli output for terraform plan and apply
-   When you query using  `terraform output`, you will be able to fetch exact values from  `terraform.tfstate`  files
-   Add  `sensitve = true`  for output  `ec2_publicdns`

# Attribute Reference - Create Public DNS URL with http:// appended
output "ec2_publicdns" {
  description = "Public DNS URL of an EC2 Instance"
  value = "http://${aws_instance.my-ec2-vm.public_dns}"
  sensitive = true
}

-   Test the flow

# Terraform Apply
terraform apply -auto-approve
Observation: You should see the value as sensitive

# Query using terraform output
terraform output ec2_publicdns



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
