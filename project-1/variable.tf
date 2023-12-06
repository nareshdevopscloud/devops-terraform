variable "environment"{
  type = string
  default = "dev"
}
variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}
variable "private_subnets_cidr" {
    type = list
    default= ["10.0.1.0/24"]
}

variable "public_subnets_cidr" {
  type = list
  default = ["10.0.2.0/24"]
}

variable "availability_zones" {
    type = list
    default =["us-east-1a"]
  
}