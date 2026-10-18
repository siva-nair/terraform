variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "source_eni_id" {
  type = string
}

variable "target_eni_id" {
  type = string
}

variable "vpc_id" {
  type = string
}
