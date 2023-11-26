provider "aws" {
region = "us-east-1"
access_key = "AKIAQYXK7FVQI3JEWCGT"
secret_key = "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"
}


resource "aws_instance" "AMI" {
  ami           = "ami-0230bd60aa48260c6"  
  instance_type = "t2.micro"
  tags = {
    Name = "TEXT"
  }
}


resource "aws_vpc" "Test" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Test"
  }
}


resource "aws_internet_gateway" "Test_IGW" {
  vpc_id = aws_vpc.Test.id

  tags = {
    Name = "Test_IGW"
  }
}


resource "aws_route_table" "Test_RT_Public" {
  vpc_id = aws_vpc.Test.id

  route {
    cidr_block = "10.1.0.0/24"
    gateway_id = aws_internet_gateway.Test_IGW.id
  }
  
  tags = {
    Name = "Test_RT_Public"
  }
}


resource "aws_subnet" "Test_Sub" {
  vpc_id     = aws_vpc.Test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Test_Sub"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Test_Sub.id
  route_table_id = aws_route_table.Test_RT_Public.id
}


resource "aws_s3_bucket" "S3-bucket" {
  bucket = "fashwal-myfirst-bucket"

  tags = {
    Name        = "S3-bucket"
    Environment = "Dev"
  }
}

