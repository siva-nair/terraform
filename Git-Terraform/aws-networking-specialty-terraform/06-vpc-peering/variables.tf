variable "region" {
  type    = string
  default = "ca-central-1"
}
variable "requester_vpc_id" {
  type = string
}
variable "accepter_vpc_id" {
  type = string
}
variable "accepter_region" {
  type    = string
  default = "ca-central-1"
}
variable "auto_accept" {
  type    = bool
  default = true
}
