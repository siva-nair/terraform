#################################################################################
// Listener public_alb_listener
#################################################################################
// Listener
resource "aws_lb_listener" "public_alb_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.ideawaves-ca.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_alb_a.arn
  }
  tags = merge(var.project_environment_qa, { Name = "public_alb_listener" })
}



resource "aws_lb_listener" "public_alb_listener_80" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public_alb_a.arn
  }
  tags = merge(var.project_environment_qa, { Name = "public_alb_listener" })
}

#################################################################################
// Listener private_alb_listener
#################################################################################
// Listener
resource "aws_lb_listener" "private_alb_listener_80" {
  load_balancer_arn = aws_lb.private_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_alb_a.arn
  }
  tags = merge(var.project_environment_qa, { Name = "private_alb_listener" })
}

// Listener
resource "aws_lb_listener" "private_alb_listener" {
  load_balancer_arn = aws_lb.private_alb.arn
  port              = "443"
  protocol          = "HTTPS"
 certificate_arn   = aws_acm_certificate.ideawaves-ca.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private_alb_a.arn
  }
  tags = merge(var.project_environment_qa, { Name = "private_alb_listener" })
}