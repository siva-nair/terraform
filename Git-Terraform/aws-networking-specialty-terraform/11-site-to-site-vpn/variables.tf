variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "vpc_id" {
  type = string
}

variable "customer_gateway_ip" {
  type = string
}

variable "customer_gateway_bgp_asn" {
  type    = number
  default = 65000
}
