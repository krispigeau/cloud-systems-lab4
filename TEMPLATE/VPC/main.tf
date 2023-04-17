# networking VPC-TEMPLATE main file


# Create a new VPC named vpc-example.
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

# Create an Internet Gateway.
resource "aws_internet_gateway" "vpc" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

# Create public route table.
resource "aws_route_table" "vpc-public-RT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc.id
  }
  tags = {
    Name = "${var.prefix}-public-RT"
  }
}

# Create one to many subnets with public IP option.
resource "aws_subnet" "vpc-public-subnets" {
  count                   = length(var.public_cidr)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidr[count.index]
  availability_zone       = var.az_pub[count.index]
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.prefix}-public-SN-${count.index + 1}"
  }
}

# Associate public subnets with Route Table
resource "aws_route_table_association" "public_access" {
  count          = length(var.public_cidr)
  subnet_id      = aws_subnet.vpc-public-subnets[count.index].id
  route_table_id = aws_route_table.vpc-public-RT.id
}