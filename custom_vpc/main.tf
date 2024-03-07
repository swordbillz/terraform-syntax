# Create a VPC
resource "aws_vpc" "vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_${var.env}"
  }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.100.0/24"
  availability_zone = local.az_a

  tags = {
    Name = "hangramit_public_subnet_1_${var.env}"
  }
}
# resource "aws_subnet" "public_subnet_2" {
#   vpc_id     = aws_vpc.vpc-01.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "hangramit_public_subnet_2"
#   }
# }
#Create a Private Subnet
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc-01.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = local.az_a

  tags = {
    Name = "hangramit_private_subnet_1_${var.env}"
  }
}

resource "aws_nat_gateway" "private_nat_gw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public_subnet_1.id
  tags = {
    Name = "nat_gw_${var.env}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "main_igw_${var.env}"
  }
}



# resource "aws_subnet" "private_subnet_2" {
#   vpc_id     = aws_vpc.vpc-01.id
#   cidr_block = "10.0.101.0/24"

#   tags = {
#     Name = "hangramit_private_subnet_2"
#   }
# }

# data "aws_subnet" "private_subnet_1" {
#   id = "subnet-0b24bd0acd8199fb5"
# }
