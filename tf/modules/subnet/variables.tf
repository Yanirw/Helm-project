variable "region" {
  description = "Google Cloud region"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "subnet_name" {
  description = "Name for the subnet"
  type        = string
}

variable "vpc_network" {
  description = "VPC network to associate the subnet with"
  type        = string
}
