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
  vpc_id = aws_vpc.Bam

  tags = {
    Name = "Bam_igw"
  }
}

resource "aws_route_table" "Bam_RT" {
  vpc_id = aws_vpc.Bam

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.Bam_igw
  }

  route {
    ipv6_cidr_block        = "::/0"
  }

  tags = {
    Name = "Bam"
  }
}