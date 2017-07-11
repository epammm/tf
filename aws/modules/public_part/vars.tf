variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "subnets" {
  type = "list"
}

variable "az" {
  type = "list"
}
