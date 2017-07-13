# Specify the provider and access details
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

#Create s3 backet for terraform.tfstate files
resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Name = "${var.bucket}"
  }
}
