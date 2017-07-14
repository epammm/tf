# Configure s3 bucket as backend for terraform
terraform {
  backend "s3" {}
}

# Specify the provider and access details
provider "aws" {
  #access_key = "${var.access_key}"
  #secret_key = "${var.secret_key}"
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
  nat_public_subnet = "${module.public_part.first_public_subnet}"
}

# Create key pair for ec2 instances
module "key_pair" {
  source       = "./modules/key_pair"
  project_name = "${var.project_name}"
  environment  = "${var.environment}"
  public_key   = "${var.public_key}"
}

# Create security group for bastion instance
module "sg_bastion" {
  source                   = "./modules/security_group"
  vpc_id                   = "${module.vpc.vpc_id}"
  project_name             = "${var.project_name}"
  environment              = "${var.environment}"
  sg_name                  = "${var.bastion_sg_name}"
  sg_description           = "${var.bastion_sg_description}"
  start_range_ingress_port = "${var.bastion_start_range_ingress_port}"
  end_range_ingress_port   = "${var.bastion_end_range_ingress_port}"
  ingress_protocol         = "${var.bastion_ingress_protocol}"
  ingress_cidr_blocks      = "${var.bastion_ingress_cidr_blocks}"
  start_range_egress_port  = "${var.bastion_start_range_egress_port}"
  end_range_egress_port    = "${var.bastion_end_range_egress_port}"
  egress_protocol          = "${var.bastion_egress_protocol}"
  egress_cidr_blocks       = "${var.bastion_ingress_cidr_blocks}"
}

# Create bastion ec2 instance
module "ec2_bastion" {
  source             = "./modules/ec2_inst"
  instance_count     = 1
  ami                = "${var.bastion_ami}"
  project_name       = "${var.project_name}"
  environment        = "${var.environment}"
  key_name           = "${module.key_pair.ec2_key_pair}"
  instance_type      = "${var.bastion_instance_type_ec2}"
  subnet_id          = "${module.public_part.public_subnets}"
  az                 = "${var.public_az}"
  pub_ip_bool        = "true"
  security_group_ids = ["${module.sg_bastion.aws_security_group}"]
  role               = "bastion"
}

# Create security group for vpc ec2 instances
module "sg_ec2_vpc" {
  source                   = "./modules/security_group"
  vpc_id                   = "${module.vpc.vpc_id}"
  project_name             = "${var.project_name}"
  environment              = "${var.environment}"
  sg_name                  = "${var.vpc_sg_name}"
  sg_description           = "${var.vpc_sg_description}"
  start_range_ingress_port = "${var.vpc_start_range_ingress_port}"
  end_range_ingress_port   = "${var.vpc_end_range_ingress_port}"
  ingress_protocol         = "${var.vpc_ingress_protocol}"
  ingress_cidr_blocks      = ["${var.vpc_cidr}"]
  start_range_egress_port  = "${var.vpc_start_range_egress_port}"
  end_range_egress_port    = "${var.vpc_end_range_egress_port}"
  egress_protocol          = "${var.vpc_egress_protocol}"
  egress_cidr_blocks       = "${var.vpc_egress_cidr_blocks}"
}

# Create security group for web ELB
module "sg_elb_web" {
  source                   = "./modules/security_group"
  vpc_id                   = "${module.vpc.vpc_id}"
  project_name             = "${var.project_name}"
  environment              = "${var.environment}"
  sg_name                  = "${var.elb_sg_name}"
  sg_description           = "${var.elb_sg_description}"
  start_range_ingress_port = "${var.elb_start_range_ingress_port}"
  end_range_ingress_port   = "${var.elb_end_range_ingress_port}"
  ingress_protocol         = "${var.elb_ingress_protocol}"
  ingress_cidr_blocks      = "${var.elb_ingress_cidr_blocks}"
  start_range_egress_port  = "${var.elb_start_range_egress_port}"
  end_range_egress_port    = "${var.elb_end_range_egress_port}"
  egress_protocol          = "${var.elb_egress_protocol}"
  egress_cidr_blocks       = "${var.elb_egress_cidr_blocks}"
}

#Create web ELB
module "elb_web" {
  source                = "./modules/elb"
  project_name          = "${var.project_name}"
  environment           = "${var.environment}"
  subnet_id             = ["${module.public_part.public_subnets}"]
  security_group_ids    = ["${module.sg_elb_web.aws_security_group}"]
  instance_port         = "${var.web_instance_balancing_port}"
  instance_protocol     = "${var.web_instance_balancing_protocol}"
  lb_port               = "${var.web_listen_lb_port}"
  lb_protocol           = "${var.web_listen_lb_protocol}"
  elb_cross_zone_bool   = "${var.elb_cross_zone_bool}"
  healthy_threshold     = "${var.elb_healthy_threshold}"
  unhealthy_threshold   = "${var.elb_unhealthy_threshold}"
  health_check_timeout  = "${var.elb_health_check_timeout}"
  health_check_target   = "${var.web_elb_health_check_target}"
  health_check_interval = "${var.elb_health_check_interval}"
  role                  = "${var.web_elb_role}"
}

############ TO BE CONTINUE ###########

#Create web autoscaling group
module "asg_web" {
  source                        = "./modules/asg"
  project_name                  = "${var.project_name}"
  environment                   = "${var.environment}"
  role                          = "${var.web_asg_role}"
  image_id                      = "${var.web_ami}"
  instance_type                 = "${var.web_instance_type_ec2}"
  key_name                      = "${module.key_pair.ec2_key_pair}"
  security_group_ids            = ["${module.sg_ec2_vpc.aws_security_group}"]
  subnet_id                     = "${module.private_part.private_subnets}"
  pub_ip_bool                   = "${var.pub_ip_bool}"
  min_asg_size                  = "${var.web_min_asg_size}"
  max_asg_size                  = "${var.web_max_asg_size}"
  load_balancers_name           = ["${module.elb_web.elb_name}"]
  adjustment_type               = "ChangeInCapacity"
  metric_aggregation_type       = "Average"
  estimated_instance_warmup     = 60
  increase_scaling_adjustment   = 1
  decrease_scaling_adjustment   = -1
  increase_interval_lower_bound = 0
  decrease_interval_upper_bound = 0
}

#Create Cloud Watch HTTP request count alarm
module "requests_alarm" {
  source                = "./modules/elb_cw"
  project_name          = "${var.project_name}"
  environment           = "${var.environment}"
  role                  = "web"
  comparison_operator   = "GreaterThanOrEqualToThreshold"
  evaluation_periods    = 1
  metric_name           = "RequestCount"
  namespace             = "AWS/ELB"
  cloud_watch_period    = 60
  statistic_type        = "Sum"
  cloud_watch_threshold = 1000
  is_actions_enabled    = "true"
  elb_name              = "${module.elb_web.elb_name}"
  alarm_description     = "HTTP Request alarm"
  alarm_actions         = "${module.asg_web.increase_policy}"
  ok_actions            = "${module.asg_web.decrease_policy}"
}

#Create service elb
module "elb_srv" {
  source                = "./modules/elb"
  project_name          = "${var.project_name}"
  environment           = "${var.environment}"
  subnet_id             = ["${module.public_part.public_subnets}"]
  security_group_ids    = ["${module.sg_elb_web.aws_security_group}"]
  instance_port         = "${var.srv_instance_balancing_port}"
  instance_protocol     = "${var.srv_instance_balancing_protocol}"
  lb_port               = "${var.srv_listen_lb_port}"
  lb_protocol           = "${var.srv_listen_lb_protocol}"
  elb_cross_zone_bool   = "${var.elb_cross_zone_bool}"
  healthy_threshold     = "${var.elb_healthy_threshold}"
  unhealthy_threshold   = "${var.elb_unhealthy_threshold}"
  health_check_timeout  = "${var.elb_health_check_timeout}"
  health_check_target   = "${var.web_elb_health_check_target}"
  health_check_interval = "${var.elb_health_check_interval}"
  role                  = "${var.srv_elb_role}"
}

#Create application autoscaling group
module "asg_app" {
  source                        = "./modules/asg"
  project_name                  = "${var.project_name}"
  environment                   = "${var.environment}"
  role                          = "asg-app"
  image_id                      = "${var.ami_web}"
  instance_type                 = "${var.instance_type_ec2_web}"
  key_name                      = "${module.key_pair.ec2_key_pair}"
  security_group_ids            = ["${module.sg_ec2_vpc.aws_security_group}"]
  subnet_id                     = "${module.private_part.private_subnets}"
  pub_ip_bool                   = "${var.pub_ip_bool}"
  min_asg_size                  = 2
  max_asg_size                  = 4
  load_balancers_name           = ["${module.elb_srv.elb_name}"]
  adjustment_type               = "ChangeInCapacity"
  metric_aggregation_type       = "Average"
  estimated_instance_warmup     = 90
  increase_scaling_adjustment   = 1
  decrease_scaling_adjustment   = -1
  increase_interval_lower_bound = 0
  decrease_interval_upper_bound = 0
}

#Create Cloud Watch HTTP request count alarm
module "app_requests_alarm" {
  source                = "./modules/elb_cw"
  project_name          = "${var.project_name}"
  environment           = "${var.environment}"
  role                  = "app"
  comparison_operator   = "GreaterThanOrEqualToThreshold"
  evaluation_periods    = 1
  metric_name           = "RequestCount"
  namespace             = "AWS/ELB"
  cloud_watch_period    = 60
  statistic_type        = "Sum"
  cloud_watch_threshold = 1000
  is_actions_enabled    = "true"
  elb_name              = "${module.elb_srv.elb_name}"
  alarm_description     = "HTTP Request to application"
  alarm_actions         = "${module.asg_web.increase_policy}"
  ok_actions            = "${module.asg_web.decrease_policy}"
}
