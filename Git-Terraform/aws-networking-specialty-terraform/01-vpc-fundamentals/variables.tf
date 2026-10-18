variable "region" { 
    type = string  
    default = "ca-central-1" 
    }
variable "name" {
     type = string  
     default = "vpc-fundamentals" 
     }
variable "vpc_cidr" { 
    type = string 
    default = "10.100.0.0/16" 
    }
variable "public_subnet_cidr" { 
    type = string 
    default = "10.100.1.0/24" 
    }
variable "private_subnet_cidr" { 
    type = string 
    default = "10.100.2.0/24" 
    }
variable "az_public" { 
    type = string 
    default = "ca-central-1a" 
    }
variable "az_private" { 
    type = string 
    default = "ca-central-1b" 
    }
