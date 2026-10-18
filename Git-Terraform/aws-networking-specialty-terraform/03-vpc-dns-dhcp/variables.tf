variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "vpc_id" {
  type = string
}

variable "domain_name" {
  type    = string
  default = "ec2.internal"
}

variable "domain_name_servers" {
  type    = list(string)
  default = ["AmazonProvidedDNS"]
}

variable "ntp_servers" {
  type    = list(string)
  default = []
}
