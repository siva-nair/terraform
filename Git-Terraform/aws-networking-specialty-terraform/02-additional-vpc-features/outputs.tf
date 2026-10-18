output "secondary_cidr" { value = aws_vpc_ipv4_cidr_block_association.secondary.cidr_block }
output "eni_id" { value = aws_network_interface.extra.id }
