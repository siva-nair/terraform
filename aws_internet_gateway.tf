resource "aws_internet_gateway" "qa-igw" {
  vpc_id = aws_vpc.staging-vpc.id

tags = merge(var.project_environment_qa, { Name = "qa-igw" })
  }



