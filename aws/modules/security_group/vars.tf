variable "vpc_id" {}

variable "project_name" {}

variable "environment" {}

variable "sg_name" {}

variable "sg_description" {}

variable "start_range_ingress_port" {
  type = "list"
}

variable "end_range_ingress_port" {
  type = "list"
}

variable "ingress_protocol" {}

variable "ingress_cidr_blocks" {
  type = "list"
}

variable "start_range_egress_port" {
  type = "list"
}

variable "end_range_egress_port" {
  type = "list"
}

variable "egress_protocol" {}

variable "egress_cidr_blocks" {
  type = "list"
}
