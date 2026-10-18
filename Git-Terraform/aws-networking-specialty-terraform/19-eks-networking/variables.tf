variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "cluster_name" {
  type    = string
  default = "eks-net"
}

variable "cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
