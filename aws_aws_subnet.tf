resource "aws_subnet" "public_subnet" {

  count             = length(var.subnet_cidrs_public)
  vpc_id            = aws_vpc.staging-vpc.id
  cidr_block        = element(var.subnet_cidrs_public, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.project_environment_qa, { Name = "public_subnet_${count.index}" })
}

resource "aws_subnet" "private_subnet" {

  count             = length(var.subnet_cidrs_private)
  vpc_id            = aws_vpc.staging-vpc.id
  cidr_block        = element(var.subnet_cidrs_private, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.project_environment_qa, { Name = "private_subnet_${count.index}" })
}

