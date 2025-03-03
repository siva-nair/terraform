# aws_vpc.tf
resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"
  tags = merge(var.project_environment_qa, { Name = "staging-vpc"})  
}
