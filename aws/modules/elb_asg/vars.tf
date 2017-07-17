variable "security_group_ids" {
  type = "list"
}

variable "subnet_id" {
  type = "list"
}

# variable "instance_id" {
#   type = "list"
# }

variable "instance_port" {}

variable "instance_protocol" {}

variable "lb_port" {}

variable "lb_protocol" {}

variable "elb_cross_zone_bool" {}

variable "healthy_threshold" {}

variable "unhealthy_threshold" {}

variable "health_check_timeout" {}

variable "health_check_target" {}

variable "health_check_interval" {}

variable "project_name" {}

variable "environment" {}

variable "role" {}
