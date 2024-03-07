terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.39.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

# Create a VPC
resource "aws_vpc" "vpc-01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

# Create a Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "hangramit_public_subnet_1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "hangramit_public_subnet_2"
  }
}
#Create a Private Subnet
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.110.0/24"

  tags = {
    Name = "hangramit_private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "10.0.111.0/24"

  tags = {
    Name = "hangramit_private_subnet_2"
  }
}
