resource "aws_eip" "ozw-vpc-2-eip" {
  vpc = true
}

resource "aws_nat_gateway" "ozw-vpc-2-ngw" {
  allocation_id = aws_eip.ozw-vpc-2-eip.id
  subnet_id     = aws_subnet.ozw-vpc2-public-subnet-1a.id
  depends_on    = [aws_internet_gateway.ozw-vpc-2-igw]

  tags = {
    Name = "ozw-vpc-2-ngw"
  }
}

resource "aws_route_table" "ozw-vpc-2-private" {
  vpc_id = aws_vpc.ozw-vpc-2.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ozw-vpc-2-ngw.id
  }

  tags = {
    Name = "ozw-vpc-2-private"
  }
}

resource "aws_route_table_association" "ozw-vpc2-private-subnet-1a-rt" {
  subnet_id      = aws_subnet.ozw-vpc2-private-subnet-1a.id
  route_table_id = aws_route_table.ozw-vpc-2-private.id
}

resource "aws_route_table_association" "ozw-vpc2-private-subnet-1c-rt" {
  subnet_id      = aws_subnet.ozw-vpc2-private-subnet-1c.id
  route_table_id = aws_route_table.ozw-vpc-2-private.id
}

resource "aws_route_table_association" "ozw-vpc2-private-subnet-1d-rt" {
  subnet_id      = aws_subnet.ozw-vpc2-private-subnet-1d.id
  route_table_id = aws_route_table.ozw-vpc-2-private.id
}