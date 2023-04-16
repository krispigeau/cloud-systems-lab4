# Main file for Blue VPC

module "vpc" {
  source      = "../VPC-TEMPLATE"
  prefix      = "Blue"
  cidr_block  = "100.64.0.0/16"
  public_cidr = ["100.64.1.0/24", "100.64.2.0/24", "100.64.3.0/24"]
  az_pub      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  #  ami          = "ami-04902260ca3d33422"
  #  ec2_type     = "t2.micro"
  #  key          = "kris_desktop"
  #  ec2_name     = "VM"
}


module "sg" {
  source = "../SG-TEMPLATE"
  prefix = "Blue"
  vpc_id = module.vpc.output_vpc_id
}