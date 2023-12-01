resource "aws_instance" "myec2" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    count = 2
    tags = {
    #   Name = "webec2"
      Name = "webec2-${count.index}"
    }
}