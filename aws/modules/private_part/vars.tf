variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "priv_subnets" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

variable "eip_id" {}

variable "nat_public_subnet" {}
