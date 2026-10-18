resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_gateway_bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"
  tags = { Name = "customer-gateway" }
}

resource "aws_vpn_gateway" "this" {
  vpc_id = var.vpc_id
  tags = { Name = "vpn-gateway" }
}

resource "aws_vpn_connection" "this" {
  vpn_gateway_id      = aws_vpn_gateway.this.id
  customer_gateway_id = aws_customer_gateway.this.id
  type                = "ipsec.1"
  static_routes_only  = false
  tags = { Name = "site-to-site-vpn" }
}
