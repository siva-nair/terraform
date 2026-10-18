resource "aws_vpc_ipv4_cidr_block_association" "secondary" {
  vpc_id     = var.vpc_id
  cidr_block = var.secondary_cidr
}

resource "aws_network_interface" "extra" {
  subnet_id   = var.subnet_id
  description = var.description
  tags = { Name = var.description }
}
