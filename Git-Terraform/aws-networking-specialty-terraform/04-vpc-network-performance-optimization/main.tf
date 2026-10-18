resource "aws_placement_group" "this" {
  name     = var.name
  strategy = var.strategy
  tags = { Name = var.name }
}
