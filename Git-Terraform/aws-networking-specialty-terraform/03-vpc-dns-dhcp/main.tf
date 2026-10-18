resource "aws_vpc_dhcp_options" "this" {
  domain_name         = var.domain_name
  domain_name_servers = var.domain_name_servers
  ntp_servers         = var.ntp_servers
  tags = { Name = "dhcp-options" }
}

resource "aws_vpc_dhcp_options_association" "this" {
  vpc_id          = var.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.this.id
}
