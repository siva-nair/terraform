
# Create a subnet in each availability zone in the VPC. Keep in mind that at this point these subnets are private without internet access. They would need other networking resources for making them accesible

# Put an instance in each subnet
resource "aws_instance" "public_ec" {
  count                       = length(var.availability_zones)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet[count.index].id
  vpc_security_group_ids      = [aws_security_group.public-allow_alb_traffic.id]
  associate_public_ip_address = var.enable_public_ip
  key_name                    = "demo-ec2-public-keypair"
  tags                        = merge(var.project_environment_qa, { Name = "public_ec_${count.index}" })
  user_data     = file("/script-for-ec1s.sh")
  
}


# Put an instance in each subnet
resource "aws_instance" "private_ec" {
  count                  = length(var.availability_zones)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet[count.index].id
  vpc_security_group_ids = [aws_security_group.private-allow_alb_traffic.id]
  key_name               = "demo-ec2-private-keypair"
  tags                   = merge(var.project_environment_qa, { Name = "private_ec_${count.index}" })
  user_data     = file("/script-for-ec2s.sh")
}
    