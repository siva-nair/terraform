// Target groups
resource "aws_lb_target_group" "private_alb_a" { // Target Group A
  name        = "private-alb-a"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.staging-vpc.id
  target_type = "ip"
  tags = merge(var.project_environment_qa, { Name = "private_alb_a" })
}

resource "aws_lb_target_group" "public_alb_a" { // Target Group A
  name        = "public-alb-a"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.staging-vpc.id
  target_type = "ip"
  tags = merge(var.project_environment_qa, { Name = "public_alb_a" })
}
