variable "instance_type" {}

variable "ami" {}

variable "instance_count" {}

variable "key_name" {}

variable "project_name" {}

variable "environment" {}

variable "pub_ip_bool" {}

variable "role" {}

variable "subnet_id" {
  type = "list"
}

variable "az" {
  type = "list"
}

variable "security_group_ids" {
  type = "list"
}
