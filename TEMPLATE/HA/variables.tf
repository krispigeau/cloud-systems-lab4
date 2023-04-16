# Modules Input Variables to Make Security Groups


variable "prefix" {
  description = "Identifier used for Name tags"
  type        = string
}

variable "ami" {
  description = "AMI number"
  type        = string

}

variable "sg_id" {
  description = "Identifier used for Name tags"
  type        = string
}


variable "vpc_id" {
  description = "ID of VPC for Target Group"
  type        = string
}



variable "subnet_ids" {
  description = "AMI number"
  type        = list
}

/*
}
variable "ec2_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key" {
  description = "Key PEM file name"
  type        = string
}
variable "ec2_name" {
  description = "The name of the EC2"
  type        = string
}
*/