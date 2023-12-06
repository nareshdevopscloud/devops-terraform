variable "environment"{
  type = string
  default = ""
}
variable "vpc_cidr" {
    type = string
    default = ""
  
}
variable "private_subnets_cidr" {
    type = list
    default= [""]
}

variable "public_subnets_cidr" {
  type = list
  default = [""]
}

variable "availability_zones" {
    type = list
    default = [""]
  
}