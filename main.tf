# Root main, ties the project together


module "VPC-blue" {
  source = "./blue"
}

module "VPC-green" {
  source = "./green"
}


output "blue_vpc_id" {
  value = module.VPC-blue.blue_output_vpc_id
}


output "blue_output_sub_ids" {
  value = module.VPC-blue.blue_output_sub_ids
}
