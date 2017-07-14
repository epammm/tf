variable "security_group_ids" {
  type = "list"
}

variable "load_balancers_name" {
  type = "list"
}

variable "subnet_id" {
  type = "list"
}

variable "project_name" {}

variable "environment" {}

variable "role" {}

variable "image_id" {}

variable "instance_type" {}

variable "key_name" {}

variable "pub_ip_bool" {}

variable "min_asg_size" {}

variable "max_asg_size" {}

variable "adjustment_type" {}

variable "metric_aggregation_type" {}

variable "estimated_instance_warmup" {}

variable "increase_scaling_adjustment" {}

variable "decrease_scaling_adjustment" {}

variable "increase_interval_lower_bound" {}

variable "decrease_interval_upper_bound" {}
