# Root main, ties the project together


module "VPC-blue" {
  source = "./blue"
}


module "VPC-green" {
  source = "./green"
}

# Print message 

output "Complete" {
  value       = "Congratulations Lab is complete here are the links"
}

# Outputs carried to root/main.tf level
# So they can be printed in the terminal output

output "blue_alb_dns_name" {
  value       = "http://${module.VPC-blue.blue_alb_dns_name}"
  description = "DNS name of the blue load balancer"
}

output "green_alb_dns_name" {
  value       = "http://${module.VPC-green.green_alb_dns_name}"
  description = "DNS name of the green load balancer"
}