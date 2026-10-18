resource "aws_lb" "this" {
  name               = var.name
  load_balancer_type = "gateway"
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "this" {
  name        = "${var.name}-tg"
  port        = 6081
  protocol    = "GENEVE"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    protocol = "TCP"
    port     = "443"
  }
}

resource "aws_lb_target_group_attachment" "appliance" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.appliance_ip
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
