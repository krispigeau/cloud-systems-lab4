# Module Input Variables to Make Security Groups

variable "prefix" {
  description = "Identifier used for Name tags"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where this SG will be created"
  type        = string
}
