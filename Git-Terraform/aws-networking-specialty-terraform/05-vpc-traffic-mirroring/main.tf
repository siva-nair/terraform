resource "aws_ec2_traffic_mirror_target" "this" {
  network_interface_id = var.target_eni_id
  description          = "mirror-target"
}

resource "aws_ec2_traffic_mirror_filter" "this" {
  description = "allow-all-filter"
  tags = { Name = "traffic-mirror-filter" }
}

resource "aws_ec2_traffic_mirror_filter_rule" "ingress" {
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.this.id
  destination_cidr_block   = "0.0.0.0/0"
  source_cidr_block        = "0.0.0.0/0"
  rule_action              = "accept"
  rule_number              = 100
  traffic_direction        = "ingress"
}

resource "aws_ec2_traffic_mirror_filter_rule" "egress" {
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.this.id
  destination_cidr_block   = "0.0.0.0/0"
  source_cidr_block        = "0.0.0.0/0"
  rule_action              = "accept"
  rule_number              = 100
  traffic_direction        = "egress"
}

resource "aws_ec2_traffic_mirror_session" "this" {
  network_interface_id     = var.source_eni_id
  traffic_mirror_target_id = aws_ec2_traffic_mirror_target.this.id
  traffic_mirror_filter_id = aws_ec2_traffic_mirror_filter.this.id
  session_number           = 1
}
