variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "subnets" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}

variable "nat_eip_id" {}

variable "nat_public_subnet" {}
