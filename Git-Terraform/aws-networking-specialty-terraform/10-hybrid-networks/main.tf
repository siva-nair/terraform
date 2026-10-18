resource "aws_ec2_transit_gateway" "hybrid" {
  amazon_side_asn = var.amazon_side_asn
  description     = var.name
  tags = { Name = var.name }
}

resource "aws_dx_gateway" "hybrid" {
  name            = "${var.name}-dxgw"
  amazon_side_asn = 64520
}
