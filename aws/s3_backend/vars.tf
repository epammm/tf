variable "access_key" {
  description = "The AWS key pair to use for resources."
}

variable "secret_key" {
  description = "The AWS key pair to use for resources."
}

variable "region" {
  description = "The AWS region."
  default     = "us-east-1"
}

variable "bucket" {
  description = "Type of environment"
}
