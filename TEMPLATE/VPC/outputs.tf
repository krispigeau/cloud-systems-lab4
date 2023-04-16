output "output_vpc_id" {
  value = aws_vpc.vpc.id
}

output "output_sub_ids" {
  value = aws_subnet.vpc-public-subnets.*.id
}