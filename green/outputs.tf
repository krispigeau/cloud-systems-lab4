# Green module outputs

output "green_alb_dns_name" {
  value       = module.ha.alb_dns_name
  description = "DNS name of the load balancer"
}

