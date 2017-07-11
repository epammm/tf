# Specify the provider and access details
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

# Create the PVC
module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "${var.vpc_cidr}"
  project_name = "${var.project_name}"
  environment  = "${var.environment}"
}

# Create EIP for NAT GateWay
module "nat_eip" {
  source = "./modules/eip"
}

#Create public subnets, internet gateway, public route tables and routes
module "public_part" {
  source             = "./modules/public_part"
  vpc_id             = "${module.vpc.vpc_id}"
  availability_zones = "${var.public_az}"
  pub_subnets        = "${var.public_subnets}"
  project_name       = "${var.project_name}"
  environment        = "${var.environment}"
}

#Create private subnets, NAT gateway, private route tables and routes
module "private_part" {
  source             = "./modules/private_part"
  vpc_id             = "${module.vpc.vpc_id}"
  availability_zones = "${var.private_az}"
  priv_subnets       = "${var.private_subnets}"
  project_name       = "${var.project_name}"
  environment        = "${var.environment}"
  eip_id             = "${module.nat_eip.eip_id}"
  nat_public_subnet  = "${module.public_part.nat_public_subnet}"
}





