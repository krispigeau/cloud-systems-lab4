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


/*
# Configure Security Group allow public.
resource "aws_security_group" "webservers" {
  name        = "webservers"
  description = "allow ssh and http"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}


# Deploy one to many EC2 instances in public subnets
resource "aws_instance" "EC2-terraformed" {
  count           = length(var.public_cidr)
  ami             = var.ami
  instance_type   = var.ec2_type
  key_name        = var.key
  security_groups = [aws_security_group.webservers.id]
  subnet_id       = aws_subnet.subnet-public-example[count.index].id
  user_data       = file("user-data.sh")
  tags            = { Name = "${var.ec2_name}-${count.index + 1}" }
}

# create a new vpc
resource "aws_vpc" "vpc_example" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

#create internet gateway
resource "aws_internet_gateway" "igw-example" {
  vpc_id = aws_vpc.vpc.id
}

#create a public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true
  availability_zone       = var.azs
  tags = {
    Name = "public-subnet"
  }
}

#create public route table
resource "aws_route_table" "RT-public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc.id
  }
  tags = {
    Name = "RT-public"
  }
}

#associate the public subnet with the route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_ud = aws_route_table.RT-public.id
}


# Secuity Group to allow public access.

resource "aws_security_group" "letweb" {
  name        = "letweb"
  description = "allow ssh and http"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

*/