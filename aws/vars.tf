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
  description = "List of private subnets."
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
