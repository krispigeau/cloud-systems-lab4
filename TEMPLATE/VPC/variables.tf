# Module Input Variables to Make VPCs 

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
