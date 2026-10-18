variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "name" {
  type    = string
  default = "gwlb"
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "appliance_ip" {
  type = string
}
