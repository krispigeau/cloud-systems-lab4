# Main file for Green VPC

module "vpc" {
  source      = "../TEMPLATE/VPC"
  prefix      = "Green"
  cidr_block  = "192.168.0.0/16"
  public_cidr = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  az_pub      = ["us-east-1d", "us-east-1e", "us-east-1f"]
}


module "sg" {
  source = "../TEMPLATE/SG"
  prefix = "Green"
  vpc_id = module.vpc.output_vpc_id
}


module "ha" {
  source        = "../TEMPLATE/HA"
  prefix        = "Green"
  ami           = "ami-0df15f4f7ee3c3243"
  sg_id         = module.sg.output_sg_id
  vpc_id        = module.vpc.output_vpc_id
  subnet_ids    = module.vpc.output_sub_ids
  instance_type = "t2.micro"
  key           = "kris_desktop"
}

/*
output "output_vpc_id" {
  value = aws_vpc.vpc.id
}

data "aws_subnets" "vpc" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.vpc.id]
  }
}
output "output_sub_ids" {
  value = data.aws_subnets.vpc.ids
}


output "output_sg_id" {
  value = aws_security_group.webservers.id
}
*/