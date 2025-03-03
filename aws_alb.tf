###############################################################################
// ALB - "public_alb"
###############################################################################

resource "aws_lb" "public_alb" { 
  name               = "public-alb" // change name to the public ideawaves-ca
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public-allow_alb_traffic.id]
  subnets            = aws_subnet.public_subnet[*].id

tags = merge(var.project_environment_qa, { Name = "public_alb-01" })

}
###############################################################################
// ALB - "private_alb"
###############################################################################
resource "aws_lb" "private_alb" {
  name               = "private-alb" // change name to the internal Application Targets
  internal           = true
  load_balancer_type = "application"
  #security_groups    = [aws_security_group.private-allow_alb_traffic.id]
  subnets            = aws_subnet.private_subnet[*].id

tags = merge(var.project_environment_qa, { Name = "private_alb-01" })
}