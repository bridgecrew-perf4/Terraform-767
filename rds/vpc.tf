resource "aws_vpc" "ozw-vpc-2" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    "Name" = "ozw-vpc-2"
  }
}

resource "aws_subnet" "ozw-vpc2-public-subnet-1a" {
  vpc_id                  = aws_vpc.ozw-vpc-2.id
  cidr_block              = "192.168.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "ozw-vpc2-public-subnet-1a"
  }
}

resource "aws_subnet" "ozw-vpc2-public-subnet-1c" {
  vpc_id                  = aws_vpc.ozw-vpc-2.id
  cidr_block              = "192.168.20.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "ozw-vpc2-public-subnet-1c"
  }
}

resource "aws_subnet" "ozw-vpc2-private-subnet-1a" {
  vpc_id                  = aws_vpc.ozw-vpc-2.id
  cidr_block              = "192.168.30.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1a"

  tags = {
    Name = "ozw-vpc2-private-subnet-1a"
  }
}

resource "aws_subnet" "ozw-vpc2-private-subnet-1c" {
  vpc_id                  = aws_vpc.ozw-vpc-2.id
  cidr_block              = "192.168.40.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-1c"

  tags = {
    Name = "ozw-vpc2-private-subnet-1c"
  }
}

resource "aws_internet_gateway" "ozw-vpc-2-igw" {
  vpc_id = aws_vpc.ozw-vpc-2.id

  tags = {
    Name = "ozw-vpc-2-igw"
  }
}

resource "aws_route_table" "ozw-vpc-2-public" {
  vpc_id = aws_vpc.ozw-vpc-2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ozw-vpc-2-igw.id
  }

  tags = {
    Name = "ozw-vpc-2-public"
  }
}

resource "aws_route_table_association" "ozw-vpc2-public-subnet-1a-rt" {
  subnet_id      = aws_subnet.ozw-vpc2-public-subnet-1a.id
  route_table_id = aws_route_table.ozw-vpc-2-public.id
}

resource "aws_route_table_association" "ozw-vpc2-public-subnet-1c-rt" {
  subnet_id      = aws_subnet.ozw-vpc2-public-subnet-1c.id
  route_table_id = aws_route_table.ozw-vpc-2-public.id
}
