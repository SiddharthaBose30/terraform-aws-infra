resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub-pub-1.id
  route_table_id = aws_route_table.my-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub-pub-2.id
  route_table_id = aws_route_table.my-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.sub-pub-3.id
  route_table_id = aws_route_table.my-rt.id
}