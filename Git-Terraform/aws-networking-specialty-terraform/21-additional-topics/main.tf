resource "aws_vpclattice_service_network" "this" {
  name      = var.name
  auth_type = var.auth_type
}
