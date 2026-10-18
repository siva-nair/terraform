resource "aws_dx_gateway" "this" {
  name            = "${var.name}-dxgw"
  amazon_side_asn = 64520
}

resource "aws_dx_private_virtual_interface" "this" {
  connection_id    = var.connection_id
  name             = "${var.name}-private-vif"
  vlan             = var.vlan
  address_family   = var.address_family
  bgp_asn          = var.bgp_asn
  amazon_address   = var.amazon_address
  customer_address = var.customer_address
  dx_gateway_id    = aws_dx_gateway.this.id
}
