output "transit_gateway_id" { value = aws_ec2_transit_gateway.this.id }
output "attachment_id" { value = aws_ec2_transit_gateway_vpc_attachment.this.id }
