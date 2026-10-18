variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "name" {
  type    = string
  default = "hybrid-hub"
}

variable "amazon_side_asn" {
  type    = number
  default = 64512
}
