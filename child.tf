module "ec2_instance" {
    source = "./day-6-module-root_ec2"
    ami_id = var.ami
    # instance_type = var.instance_type
    instance_type = lookup(var.ec2_type, terraform.workspace)


}

