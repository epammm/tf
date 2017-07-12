variable "access_key" {
  description = "The AWS key pair to use for resources."
}

variable "secret_key" {
  description = "The AWS key pair to use for resources."
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
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC."
  default     = "10.0.0.0/16"
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
  description = "List of private subnets."
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "sg_name" {
  description = "Name of security group."
  default     = "default_sg"
}

variable "sg_description" {
  description = "Description for security group."
  default     = "Allow HTTP and HTTPS traffic"
}

variable "start_range_ingress_port" {
  description = "Start range port for ingress rules (or certain ports)"
  default     = [80, 443]
}

variable "end_range_ingress_port" {
  description = "End range port for ingress rules (or certain ports)"
  default     = [80, 443]
}

variable "ingress_protocol" {
  description = "ingress ports protocol"
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "List of cidr blocks for ingress rules"
  default     = ["213.184.243.0/24", "217.21.56.0/24", "217.21.63.0/24", "213.184.231.0/24", "86.57.255.88/29", "194.158.197.0/29"]
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

variable "public_key" {
  description = "Public key for comnnecting to ec2 instances"
}

variable "instance_type_ec2_web" {
  description = "The Instance Type."
  default     = "t2.micro"
}

variable "ami_web" {
  description = "AMI"
  default     = "ami-a4c7edb2"
}

variable "count_ec2_web" {
  description = "Count of instances"
  default     = "2"
}

variable "pub_ip_bool" {
  description = "Create public ip address for instance?"
  default     = "false"
}
