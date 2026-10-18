variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "name" {
  type    = string
  default = "client-vpn"
}

variable "server_certificate_arn" {
  type = string
}

variable "client_cidr_block" {
  type    = string
  default = "172.16.0.0/22"
}

variable "subnet_id" {
  type = string
}

variable "target_network_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}
