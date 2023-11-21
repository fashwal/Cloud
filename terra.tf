provider "aws" {
region = "us-east-1"
access_key = "AKIAQYXK7FVQI3JEWCGT"
secret_key = "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"
}

resource "aws_vpc" "Bam" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Bam"
  }
}

resource "aws_internet_gateway" "Bam_igw" {
  vpc_id = "vpc-0737f0349aba65f45"

  tags = {
    Name = "Bam_igw"
  }
}

resource "aws_route_table" "Bam_RT" {
  vpc_id = "vpc-0737f0349aba65f45"

  route {
    cidr_block = "10.1.0.0/24"
    gateway_id = "igw-06ce0e9f07fb5ab9d"
  }

  tags = {
    Name = "Bam"
  }
}

