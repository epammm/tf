variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "pub_subnets" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}
