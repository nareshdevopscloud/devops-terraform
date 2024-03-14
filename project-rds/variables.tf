############### Main Variables ##################

variable "main_allocated_storage"{
type = number
default = "20"
}
variable "main_db_engine"{
type = string
default = "MYSQL"
}
variable "main_db_instance_class"{
type = srting
default = "db.t2.micro"
}
variable "main_db_username" {
type = string  
default = "admin"
}
variable "parameter_group_name" {
    type = string
default = "default.mysql8.0"
}
variable "password " {
type = string  
default = "baby.sravs"
}
variable "main_db_version" {
    type = string
default = "8.0.35"
  
}
#################replica##############
variable "replica_instance_class" {
    type = string
default = "db.t2.micro"
  
}

variable "replica_count" {
  type = number
  default = 2
}

variable "rds_replica_azs" {
  type = list(string)
  default = ["eu-west-2c"]
}
variable "sg_vpc_id" {
    type = string
default = ""
  
}
variable "sg_ingress_from_port" {
    type = number
default = "80"
  
}
variable "sg_ingress_to_port" {
    type = number
default = "3306"
  
}
variable "cidr"{
type = list(string)
default = ["0.0.0.0/0"]
}
variable "sg_protocol" {
    type = string
default = "tcp"
}
variable "sg_name" {
  type = string
default = "name"
}
