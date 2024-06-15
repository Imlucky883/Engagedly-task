# Fetch the custom VPC by name
data "aws_vpc" "custom" {
  filter {
    name   = "tag:Name"
    values = [var.custom_vpc_name]
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.custom.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a" # Adjust to your desired availability zone

  tags = {
    Name = "Public Subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.custom.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "ap-south-1a" # Adjust to your desired availability zone

  tags = {
    Name = "Private Subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.custom.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = data.aws_vpc.custom.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

