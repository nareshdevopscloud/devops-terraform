resource "aws_instance" "test" {
    ami = var.ami_id
    instance_type = var.instance_type
    associate_public_ip_address = true
    key_name = var.key_name
    # subnet_id = aws_subnet.dev_sub.id
    # security_groups = [aws_security_group.dev_sg.id]
    availability_zone = var.az_zone
    # user_data = file("filename")








    
}
