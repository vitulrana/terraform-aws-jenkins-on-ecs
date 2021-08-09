variable "profile" {
  default = "default"
} 

variable "key_name" {
  default = ""                                                                                                  
}

variable "region" {
  default = "ap-south-1"
}

variable "subnet-az" {
  default = "ap-south-1a"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "ami" {
  default = "ami-0e13e0df31e6aa478"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ecs_task_role_arn" {
  default = ""
}

variable "ecs_execution_role_arn" {
  default = ""
}
