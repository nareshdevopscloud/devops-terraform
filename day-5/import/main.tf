resource "aws_instance" "myec2" {
    ami = "ami-0230bd60aa48260c6"
    availability_zone ="us-east-1c"
    instance_type = "t3.micro"
    key_name = "test"
    tags = {
      Name = "check"
    }


  
}