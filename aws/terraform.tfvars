########## General project variables ##########

access_key = "YOUR ACCESS KEY"

secret_key = "YOUR SECRET KEY"

aws_region = "us-east-1"

project_name = "dream"

environment = "stage"

########## VPC variables ##########

vpc_cidr = "10.0.0.0/16"

public_az = ["us-east-1a", "us-east-1b"]

private_az = ["us-east-1a", "us-east-1b"]

public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgQbL/DAH3im1or944+LnggMIhCehgQf38KAc4prepTMfSewbAITjJsRA7K+FcNKghSWn+kNPzSHbC8SuN/xU6YC5lJWEIPhRI6tTVByVFkkRX3KebBpI0GF/eQzrJaYcaFz+l3UQ41BdTleZ8HhroCShvhztK7RHzecSfM4IwLbWrz30A/HTpOA++x6UBLf5+7iFUWSVk7xeOshCiSCn9yruPo8ap5Hd2DDPeYtup4N6Ut2Adbg84kT2S+YUcmD3EOIl8siV8I9LAmmTC3AR5C/yGAcEayyHhISnHXVD9mwNfx5caQ/gzuM6PB6OhJMlPaGv2kUPxtYIp6yOU9Kw/ vagrant@ansible.bm"

########## Security groups variables ##########

sg_name = "ec2-web"

sg_description = "Allow HTTP and HTTPS traffic"

start_range_ingress_port = [80, 443]

end_range_ingress_port = [80, 443]

ingress_protocol = "tcp"

ingress_cidr_blocks = ["213.184.243.0/24", "217.21.56.0/24", "217.21.63.0/24", "213.184.231.0/24", "86.57.255.88/29", "194.158.197.0/29"]

start_range_egress_port = [0]

end_range_egress_port = [0]

egress_protocol = "-1"

egress_cidr_blocks = ["0.0.0.0/0"]

instance_type_ec2_web = "t2.micro"

ami_web = "ami-a4c7edb2"

pub_ip_bool = "false"

instance_port         = 80

instance_protocol     = "http"

lb_port               = 80

lb_protocol           = "http"

elb_cross_zone_bool   = "true"

healthy_threshold     = 2

unhealthy_threshold   = 2

health_check_timeout  = 3

health_check_target   = "HTTP:80/"

health_check_interval = 30


