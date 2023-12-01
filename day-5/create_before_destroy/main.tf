resource "aws_instance" "test" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t3.micro"
    availability_zone = "us-east-1a"
    
  tags = {
    Name = "test"
  }

#   lifecycle {
#     create_before_destroy = true
#   }

  lifecycle {
    ignore_changes = [tags,]
  }
}
