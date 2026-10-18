variable "region" {
  type    = string
  default = "ca-central-1"
}
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "security_group_ids" { type = list(string) }
variable "service_name" {
  type    = string
  default = "com.amazonaws.ca-central-1.ec2"
}
