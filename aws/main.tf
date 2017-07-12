# Specify the provider and access details
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.aws_region}"
}

# Create the PVC
module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "${var.vpc_cidr}"
  project_name = "${var.project_name}"
  environment  = "${var.environment}"
}

# Create EIP for NAT GateWay
module "eip" {
  source = "./modules/eip"
}

#Create public subnets, internet gateway, public route tables and routes
module "public_part" {
  source       = "./modules/public_part"
  vpc_id       = "${module.vpc.vpc_id}"
  az           = "${var.public_az}"
  subnets      = "${var.public_subnets}"
  project_name = "${var.project_name}"
  environment  = "${var.environment}"
}

#Create private subnets, NAT gateway, private route tables and routes
module "private_part" {
  source            = "./modules/private_part"
  vpc_id            = "${module.vpc.vpc_id}"
  az                = "${var.private_az}"
  subnets           = "${var.private_subnets}"
  project_name      = "${var.project_name}"
  environment       = "${var.environment}"
  eip_id            = "${module.eip.eip_id}"
  nat_public_subnet = "${module.public_part.nat_public_subnet}"
}

# Create key pair for ec2 instances
module "key_pair" {
  source       = "./modules/key_pair"
  project_name = "${var.project_name}"
  environment  = "${var.environment}"
  public_key   = "${var.public_key}"
}

# Create security group for web ec2 instances
module "sg_ec2_web" {
  source                   = "./modules/security_group"
  vpc_id                   = "${module.vpc.vpc_id}"
  project_name             = "${var.project_name}"
  environment              = "${var.environment}"
  sg_name                  = "${var.sg_name}"
  sg_description           = "${var.sg_description}"
  start_range_ingress_port = "${var.start_range_ingress_port}"
  end_range_ingress_port   = "${var.end_range_ingress_port}"
  ingress_protocol         = "${var.ingress_protocol}"
  ingress_cidr_blocks      = "${var.ingress_cidr_blocks}"
  start_range_egress_port  = "${var.start_range_egress_port}"
  end_range_egress_port    = "${var.end_range_egress_port}"
  egress_protocol          = "${var.egress_protocol}"
  egress_cidr_blocks       = "${var.egress_cidr_blocks}"
}

# Create web ec2 instances
module "ec2_web" {
  source             = "./modules/ec2_inst"
  instance_count     = "${var.count_ec2_web}"
  ami                = "${var.ami_web}"
  project_name       = "${var.project_name}"
  environment        = "${var.environment}"
  key_name           = "${module.key_pair.ec2_key_pair}"
  instance_type      = "${var.instance_type_ec2_web}"
  subnet_id          = "${module.private_part.private_subnets}"
  az                 = "${var.private_az}"
  pub_ip_bool        = "${var.pub_ip_bool}"
  security_group_ids = ["${module.sg_ec2_web.aws_security_group}"]
  role               = "ec2_web"
  user_data          = "${file("./scripts/web_bootstrap.sh")}"
}
