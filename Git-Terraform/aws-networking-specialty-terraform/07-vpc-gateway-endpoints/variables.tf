variable "region" {
  type    = string
  default = "ca-central-1"
}
variable "vpc_id" { type = string }
variable "route_table_ids" { type = list(string) }
