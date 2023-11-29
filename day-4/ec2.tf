data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


resource "aws_instance" "test" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = "test"
    subnet_id = aws_subnet.dev_sub.id
    security_groups = [aws_security_group.dev_sg.id]
    availability_zone = "us-east-1a"
    user_data = file("httpd.sh")
    depends_on = [ aws_ebs_volume.dev ]
}

resource "aws_ebs_volume" "dev" {
 availability_zone = "us-east-1a"
  size              = 8

  tags = {
    Name = "ebs_dev_additional_volume"
  }
}

resource "aws_volume_attachment" "dev_ebs" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.dev.id
  instance_id = aws_instance.test.id
}


  
