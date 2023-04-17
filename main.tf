# Root main, ties the project together


module "VPC-blue" {
  source = "./blue"
}


module "VPC-green" {
  source = "./green"
}


# Outputs carried to root/main.tf ut
# So I can see them in the terminal output

# VPC-blue outputs
output "blue_vpc_id" {
  value = module.VPC-blue.blue_output_vpc_id
}


output "blue_output_sub_ids" {
  value = module.VPC-blue.blue_output_sub_ids
}


output "blue_output_sg_id" {
  value = module.VPC-blue.blue_output_sg_id
}

/*

# VPC-green outputs
output "green_vpc_id" {
  value = module.VPC-green.green_output_vpc_id
}


output "green_output_sub_ids" {
  value = module.VPC-green.green_output_sub_ids
}

*/