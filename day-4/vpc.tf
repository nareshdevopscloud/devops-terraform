# Create VPC
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "dev"
    }
  
}

# Create Subnet

resource "aws_subnet" "dev_sub" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/25"
    availability_zone = "us-east-1a"

    tags = {
      Name= "dev_pub_subnet"
    }
  
}
# Create Internet Gateway
resource "aws_internet_gateway" "dev_ig" {
    vpc_id = aws_vpc.dev.id
  
}

# Create Route Table and # Create Route in Route Table for Internet Access

resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_ig.id
  }

}

# Associate Route Table with Subnet

resource "aws_route_table_association" "dev" {
  subnet_id      = aws_subnet.dev_sub.id
  route_table_id = aws_route_table.dev_rt.id
}
# Create Security Group in the VPC with port 80, 22 as inbound open

resource "aws_security_group" "dev_sg" {
  name        = "dev_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.dev.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}
# Create EC2 Instance in respective new vpc, new subnet created above with a static key pair, associate Security group created earlier