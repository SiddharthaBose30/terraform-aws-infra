resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
}


resource "aws_subnet" "sub-pub-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.ZONE1
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-sub-1"
  }
}

resource "aws_subnet" "sub-pub-2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
availability_zone = var.ZONE2
map_public_ip_on_launch = true
  tags = {
    Name = "pub-sub-2"
  }
}

resource "aws_subnet" "sub-pub-3" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.3.0/24"
availability_zone = var.ZONE3
map_public_ip_on_launch = true
  tags = {
    Name = "pub-sub-3"
  }
}

resource "aws_subnet" "sub-pvt-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.4.0/24"
availability_zone = var.ZONE1
  tags = {
    Name = "pvt-sub-1"
  }
}

resource "aws_subnet" "sub-pvt-2" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.5.0/24"
availability_zone = var.ZONE2
  tags = {
    Name = "pvt-sub-2"
  }
}

resource "aws_subnet" "sub-pvt-3" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.6.0/24"
availability_zone = var.ZONE3
  tags = {
    Name = "pvt-sub-3"
  }
}