variable "region" {
  type    = string
  default = "ca-central-1"
}
variable "name" {
  type    = string
  default = "core-tgw"
}
variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
