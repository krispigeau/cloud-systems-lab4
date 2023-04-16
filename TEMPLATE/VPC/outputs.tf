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
