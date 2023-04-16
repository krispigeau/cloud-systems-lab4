# Main file for Green VPC

module "vpc" {
  source      = "../VPC-TEMPLATE"
  prefix      = "Green"
  cidr_block  = "192.168.0.0/16"
  public_cidr = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  az_pub      = ["us-east-1d", "us-east-1e", "us-east-1f"]
  #  ami          = "ami-04902260ca3d33422"
  #  ec2_type     = "t2.micro"
  #  key          = "kris_desktop"
  #  ec2_name     = "VM"
}

module "sg" {
  source = "../SG-TEMPLATE"
  prefix = "Green"
  vpc_id = module.vpc.output_vpc_id
}