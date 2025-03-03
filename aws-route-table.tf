
resource "aws_route_table" "tf_public_route_table" {
  vpc_id = aws_vpc.staging-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.qa-igw.id
  }

  tags = {
    Name = "tf_igw-route_table"
  }
}
#############################################################
resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.subnet_cidrs_public)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
  route_table_id = aws_route_table.tf_public_route_table.id
}


resource "aws_route_table" "tf_private_route_table" {
  vpc_id = aws_vpc.staging-vpc.id

  tags = {
    Name = "private-route_table"
  }
}

#############################################################
resource "aws_route_table_association" "private_subnet_asso" {
  count          = length(var.subnet_cidrs_private)
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
  route_table_id = aws_route_table.tf_private_route_table.id
}
