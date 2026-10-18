resource "aws_ec2_client_vpn_endpoint" "this" {
  description            = var.name
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.client_cidr_block
  split_tunnel           = true
  vpc_id                 = null
  security_group_ids     = var.vpc_security_group_ids

  authentication_options {
    type = "certificate-authentication"
    root_certificate_chain_arn = var.server_certificate_arn
  }

  connection_log_options {
    enabled = false
  }

  tags = { Name = var.name }
}

resource "aws_ec2_client_vpn_network_association" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  subnet_id              = var.subnet_id
}

resource "aws_ec2_client_vpn_authorization_rule" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  target_network_cidr    = var.target_network_cidr
  authorize_all_groups   = true
}

resource "aws_ec2_client_vpn_route" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  destination_cidr_block = var.target_network_cidr
  target_vpc_subnet_id   = var.subnet_id
}
