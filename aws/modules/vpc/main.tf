# Create the PVC
resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name    = "${var.project_name}_${var.environment}"
    project = "${var.project_name}"
    role    = "vpc"
  }
}
