
resource "aws_lb_target_group_attachment" "public_ec" {
  # covert a list of instance objects to a map with instance ID as the key, and an instance
  # object as the value.
  for_each = {
    for k, v in aws_instance.public_ec :
    k => v
  }

  target_group_arn = aws_lb_target_group.public_alb_a.arn
  target_id        = each.value.private_ip
  port             = 80
  
}

resource "aws_lb_target_group_attachment" "private_ec" {
  # covert a list of instance objects to a map with instance ID as the key, and an instance
  # object as the value.
  for_each = {
    for k, v in aws_instance.private_ec :
    k => v
  }

  target_group_arn = aws_lb_target_group.private_alb_a.arn
  target_id        = each.value.private_ip  
  port             = 80
}