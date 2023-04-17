# Modules Input Variables to Make Security Groups


variable "prefix" {
  description = "Identifier used for Name tags"
  type        = string
}

variable "ami" {
  description = "AMI number of image to use for launch template"
  type        = string

}


variable "instance_type" {
  description = "EC2 instance type for launch template"
  type        = string
}

variable "sg_id" {
  description = "Securit groups to use for launch template"
  type        = string
}

variable "key" {
  description = "Key PEM file name for launch template"
  type        = string
}


variable "vpc_id" {
  description = "ID of VPC for Target Group"
  type        = string
}


variable "subnet_ids" {
  description = "subnets for auto-scalling group and load balancer"
  type        = list(any)
}
