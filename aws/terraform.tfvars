access_key = "YOUR ACCESS KEY"

secret_key = "YOUR SECRET KEY"

aws_region = "us-east-1"

environment = "stage"

project_name = "dream"

vpc_cidr = "10.0.0.0/16"

public_az = ["us-east-1a", "us-east-1b"]

private_az = ["us-east-1a", "us-east-1b"]

public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA2gT7K9dU1SiqGkvoJC6yBVDk3B6bZkPMWAwNwCMykadM3XDYsM7rRZ2pHWPxNw5G2hfFJ2715ol+F703u+AqJSTgno4y20Vpq38E3fq1BMw7M1mpl2G2k4ongTbooiEllCIDzS894nCaIAGsDAinht7Dnqt+Y+ZplEvjgd9VLsIUPMKKzYeLTDZfDqHKc4sBdeXO8tOvZabvI0ux0EwXD4yVG6syF7FcuK9j09hYHHsVNE2fg0ihWpJ0tetJVEJb5wpv29M+4qBuov5CIrLfAsNAg/I+ZrGYQoVEvYKf+uTIJ4PkTDpZRFSR+o9QZT/ofHTzjFNKosQLFPM4VgXwsw== rsa-key-20170712"

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


