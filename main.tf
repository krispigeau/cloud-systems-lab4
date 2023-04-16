# Root main, ties the project together


module "VPC-blue" {
  source = "./blue"
}

module "VPC-green" {
  source = "./green"
}

