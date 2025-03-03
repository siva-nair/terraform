variable "instance_type" {
  description = "Instance type t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2
}
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3s"]
}

variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "dev"
  }
}

// Ami ID for free tier
variable "ami_id" {
  description = "TF-ami_id"
  default     = "ami-04b4f1a9cf54c11d0"
}

variable "project_environment_dev" {
  description = "TF-project_name_and_environment"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "dev"
  }
}

variable "project_environment_qa" {
  description = "TF-project_name_and_environment"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "qa"
  }
}

variable "project_environment_prod" {
  description = "TF-project_name_and_environment"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "prod"
  }
}


variable "subnet_cidrs_public" {
  description = "Subnet CIDRs for public subnets (length must match configured availability_zones)"
  # this could be further simplified / computed using cidrsubnet() etc.
  # https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet-iprange-newbits-netnum-
  default = ["10.5.1.0/24", "10.5.2.0/24"]
  type    = list(string)
}

variable "subnet_cidrs_private" {
  description = "Subnet CIDRs for pprivate subnets (length must match configured availability_zones)"
  # this could be further simplified / computed using cidrsubnet() etc.
  # https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet-iprange-newbits-netnum-
  default = ["10.5.5.0/24", "10.5.6.0/24"]
  type    = list(string)
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
  default     = ["us-east-1a", "us-east-1b"]
  #default = ["us-east-1a", "us-east-1b","us-east-1c", "us-east-1d"]
}

