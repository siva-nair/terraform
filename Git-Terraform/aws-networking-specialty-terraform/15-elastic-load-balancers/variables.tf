variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "name" {
  type    = string
  default = "app-alb"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "target_port" {
  type    = number
  default = 80
}
