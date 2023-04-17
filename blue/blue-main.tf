# Main file for Blue VPC

module "vpc" {
  source      = "../TEMPLATE/VPC"
  prefix      = "Blue"
  cidr_block  = "100.64.0.0/16"
  public_cidr = ["100.64.1.0/24", "100.64.2.0/24", "100.64.3.0/24"]
  az_pub      = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "sg" {
  source = "../TEMPLATE/SG"
  prefix = "Blue"
  vpc_id = module.vpc.output_vpc_id
}


module "ha" {
  source     = "../TEMPLATE/HA"
  prefix     = "Blue"
  ami        = "ami-0df15f4f7ee3c3243"
  sg_id      = module.sg.output_sg_id
  vpc_id     = module.vpc.output_vpc_id
  subnet_ids = module.vpc.output_sub_ids
  instance_type = "t2.micro"
  key = "kris_desktop"
}
