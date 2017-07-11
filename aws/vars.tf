variable "access_key" {
  description = "The AWS key pair to use for resources."
  default     = "ENTER YOUR ACCESS KEY"
}

variable "secret_key" {
  description = "The AWS key pair to use for resources."
  default     = "ENTER YOUR SECRET KEY"
}

variable "aws_region" {
  description = "The AWS region."
  default     = "us-east-1"
}

variable "environment" {
  description = "Type of environment"
  default     = "stage"
}

variable "project_name" {
  description = "The name of project."
  default     = "dream"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR of the VPC."
}

variable "public_az" {
  description = "List of public availability zones."
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_az" {
  description = "List of private availability zones."
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "List of public subnets."
  default     = ["10.0.1.0/24"]
}

variable "private_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "sg_name" {
  description = "Name of security group."
  default     = "elb_sg"
}

variable "sg_description" {
  description = "Description for security group."
  default     = "Allow HTTP and HTTPS traffic"
}

variable "start_range_ingress_port" {
  description = "Start range port for ingress rules (or certain ports)"
  default     = [80, 443, 500]
}

variable "end_range_ingress_port" {
  description = "End range port for ingress rules (or certain ports)"
  default     = [80, 443, 1024]
}

variable "ingress_protocol" {
  description = "ingress ports protocol"
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "List of cidr blocks for ingress rules"
  default     = ["0.0.0.0/0", "1.1.1.0/24"]
}

variable "start_range_egress_port" {
  description = "Start range port for egress rules (or certain ports)"
  default     = [0]
}

variable "end_range_egress_port" {
  description = "End range port for egress rules (or certain ports)"
  default     = [0]
}

variable "egress_protocol" {
  description = "egress ports protocol"
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "List of cidr blocks for egress rules"
  default     = ["0.0.0.0/0"]
}

variable "instance_type_ec2_web" {
  default     = "t2.micro"
  description = "The Instance Type."
}

variable "ami_web" {
  default     = "ami-a4c7edb2"
  description = "AMI"
}

variable "count_ec2_web" {
  default     = "2"
  description = "Count of instances"
}

variable "key_name" {
  default     = "kuzniatsou_us-east-1"
  description = "The AWS key pair to use for resources."
}

variable "pub_ip_bool" {
  default     = "false"
  description = "Create public ip address for instance?"
}
