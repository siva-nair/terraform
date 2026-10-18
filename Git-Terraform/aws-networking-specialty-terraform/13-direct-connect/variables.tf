variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "connection_id" {
  type = string
}

variable "name" {
  type    = string
  default = "dx-lab"
}

variable "vlan" {
  type    = number
  default = 101
}

variable "address_family" {
  type    = string
  default = "ipv4"
}

variable "bgp_asn" {
  type    = number
  default = 65000
}

variable "amazon_address" {
  type    = string
  default = "175.45.176.1/30"
}

variable "customer_address" {
  type    = string
  default = "175.45.176.2/30"
}
