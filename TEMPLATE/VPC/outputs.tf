output "output_vpc_id" {
  description = "outputs VPC ID"
  value       = aws_vpc.vpc.id
}

output "output_sub_ids" {
  description = "outputs List of subnet IDs"
  value       = aws_subnet.vpc-public-subnets.*.id
}