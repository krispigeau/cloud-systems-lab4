# Modules Input Variables to Make VPCs 

variable "prefix" {
  description = "Identifier used for Name tags"
  type        = string
}


variable "cidr_block" {
  description = "the IPv4 address space of the VPC"
  type        = string
}

variable "public_cidr" {
  description = "list of public subnets addresses"
  type        = list(string)
}

variable "az_pub" {
  description = "availability zone"
  type        = list(string)
}

/*
variable "ami" {
  description = "AMI number"
  type        = string

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