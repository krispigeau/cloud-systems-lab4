# Green module outputs

output "green_output_vpc_id" {
  value = module.vpc.output_vpc_id
}

output "green_output_sub_ids" {
  value = module.vpc.output_sub_ids
}

output "green_output_sg_id" {
  value = module.sg.output_sg_id
}

output "green_alb_dns_name" {
  value       = module.ha.alb_dns_name
  description = "DNS name of the load balancer"
}

