variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "vpc_id" {
  type = string
}

variable "secondary_cidr" {
  type    = string
  default = "10.101.0.0/16"
}

variable "subnet_id" {
  type = string
}

variable "description" {
  type    = string
  default = "extra-eni"
}
