variable "ec2_type" {
    # type = string
    type=map(string)
    default = {
        "dev"="t2.nano"
        "test"="t2.micro"
    }
}
# variable "instance_type"{
# type = string
# default=""
# }

variable "ami" {
    type = string
    default = "ami-0230bd60aa48260c6"
  
  
}
