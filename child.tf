module "ec2_instance" {
    source = "./root_ec2"
    ami_id = var.ami
    instance_type = var.instance_type
    # instance_type = lookup(var.ec2_type, terraform.workspace)


}

