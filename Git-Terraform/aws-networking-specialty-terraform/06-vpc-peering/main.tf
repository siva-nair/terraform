resource "aws_vpc_peering_connection" "this" {
  vpc_id      = var.requester_vpc_id
  peer_vpc_id = var.accepter_vpc_id
  peer_region = var.accepter_region
  auto_accept = var.auto_accept
  tags = { Name = "vpc-peering" }
}
