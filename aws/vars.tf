########## General project variables ##########
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

variable "project_name" {
  description = "The name of project."
}

variable "environment" {
  description = "Type of environment"
  default     = "stage"
}

########## VPC variables ##########

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

variable "public_key" {
  description = "Public key for comnnecting to ec2 instances"
}

########## Security groups variables ##########

### Bastion security group ###

variable "bastion_sg_name" {
  description = "Name of bastion security group."
  default     = "bastion_sg"
}

variable "bastion_sg_description" {
  description = "Description for bastion security group."
  default     = "Allow 22 port only"
}

variable "bastion_start_range_ingress_port" {
  description = "Start range port for bastion ingress rules (or certain ports)"
  default     = [22]
}

variable "bastion_end_range_ingress_port" {
  description = "End range port for bastion ingress rules (or certain ports)"
  default     = [22]
}

variable "bastion_ingress_protocol" {
  description = "ingress ports protocol for bastion instance "
  default     = "tcp"
}

variable "bastion_ingress_cidr_blocks" {
  description = "List of ingress cidr blocks for ingress rules"
  default     = ["213.184.243.0/24", "217.21.56.0/24", "217.21.63.0/24", "213.184.231.0/24", "86.57.255.88/29", "194.158.197.0/29"]
}

variable "bastion_start_range_egress_port" {
  description = "Start range port for bastion egress rules (or certain ports)"
  default     = [0]
}

variable "bastion_end_range_egress_port" {
  description = "End range port for bastion egress rules (or certain ports)"
  default     = [0]
}

variable "bastion_egress_protocol" {
  description = "egress ports protocol for bastion instance"
  default     = "-1"
}

variable "bastion_egress_cidr_blocks" {
  description = "List of egress cidr blocks for egress rules"
  default     = ["0.0.0.0/0"]
}

### VPC security group ###

variable "vpc_sg_name" {
  description = "Name of security group for all instances in private network."
  default     = "vpc_sg"
}

variable "vpc_sg_description" {
  description = "Description for vpc security group."
  default     = "Allow 22, 80 and 443 ports inside private network"
}

variable "vpc_start_range_ingress_port" {
  description = "Start range port for ingress rules in private network (or certain ports)"
  default     = [22, 80, 443, 8080]
}

variable "vpc_end_range_ingress_port" {
  description = "End range port for ingress rules in private network (or certain ports)"
  default     = [22, 80, 443, 8080]
}

variable "vpc_ingress_protocol" {
  description = "ingress ports protocol for all instances in private network "
  default     = "tcp"
}

variable "vpc_start_range_egress_port" {
  description = "Start range port for egress rules in private network (or certain ports)"
  default     = [0]
}

variable "vpc_end_range_egress_port" {
  description = "End range port for egress rules in private network (or certain ports)"
  default     = [0]
}

variable "vpc_egress_protocol" {
  description = "egress ports protocol for all instances in private network"
  default     = "-1"
}

variable "vpc_egress_cidr_blocks" {
  description = "List of egress cidr blocks for all instances in private network"
  default     = ["0.0.0.0/0"]
}

### ELB security group ###

variable "elb_sg_name" {
  description = "Name of security group for ELB."
  default     = "elb_sg"
}

variable "elb_sg_description" {
  description = "Description for ELB security group."
  default     = "Allow 80 and 443 ports only"
}

variable "elb_start_range_ingress_port" {
  description = "Start range port for ELB ingress rules (or certain ports)"
  default     = [80, 443]
}

variable "elb_end_range_ingress_port" {
  description = "End range port for ELB ingress rules (or certain ports)"
  default     = [80, 443]
}

variable "elb_ingress_protocol" {
  description = "ingress ports protocol for ELB"
  default     = "tcp"
}

variable "elb_ingress_cidr_blocks" {
  description = "List of ingress cidr blocks for ELB egress rules"
  default     = ["0.0.0.0/0"]
}

variable "elb_start_range_egress_port" {
  description = "Start range port for ELB egress rules (or certain ports)"
  default     = [0]
}

variable "elb_end_range_egress_port" {
  description = "End range port for ELB egress rules (or certain ports)"
  default     = [0]
}

variable "elb_egress_protocol" {
  description = "egress ports protocol for ELB"
  default     = "-1"
}

variable "elb_egress_cidr_blocks" {
  description = "List of egress cidr blocks for ELB"
  default     = ["0.0.0.0/0"]
}

########## Custom instances variables ##########

### Bastion instance ###

variable "bastion_ami" {
  description = "AMI for bastion instance"
  default     = "ami-a4c7edb2"
}

variable "bastion_instance_type_ec2" {
  description = "The Instance Type."
  default     = "t2.micro"
}

### Jenkins server ###

variable "jenkins_instance_count" {
  description = "Number of instance for Jenkins server"
  default     = 1
}

variable "jenkins_ami" {
  description = "AMI for Jenkins server"
  default     = "ami-a4c7edb2"
}

variable "jenkins_instance_type_ec2" {
  description = "The Instance Type."
  default     = "t2.micro"
}

########## General ELB variables ##########

variable "elb_cross_zone_bool" {
  description = "Enable cross-zone load balancing?"
  default     = "true"
}

variable "elb_healthy_threshold" {
  description = "The number of checks before the instance is declared healthy"
  default     = 2
}

variable "elb_unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy"
  default     = 2
}

variable "elb_health_check_timeout" {
  description = "The length of time before the check times out"
  default     = 3
}

variable "elb_health_check_interval" {
  description = "The interval between elb checks"
  default     = 30
}

########## Custom ELB variables ##########

### Web ELB ###

variable "web_instance_balancing_port" {
  description = "The port on the instance to route to"
  default     = 8080
}

variable "web_instance_balancing_protocol" {
  description = "The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL"
  default     = "http"
}

variable "web_listen_lb_port" {
  description = "The port to listen on for the load balancer"
  default     = 80
}

variable "web_listen_lb_protocol" {
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL"
  default     = "http"
}

variable "web_elb_role" {
  description = "ELB role"
  default     = "elb-web"
}

variable "web_elb_health_check_target" {
  description = "The target of the check"
  default     = "HTTP:8080/"
}

### Service ELB ###

variable "srv_instance_balancing_port" {
  description = "The port on the instance to route to"
  default     = 8080
}

variable "srv_instance_balancing_protocol" {
  description = "The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL"
  default     = "http"
}

variable "srv_listen_lb_port" {
  description = "The port to listen on for the load balancer"
  default     = 80
}

variable "srv_listen_lb_protocol" {
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL"
  default     = "http"
}

variable "srv_elb_role" {
  description = "ELB role"
  default     = "elb-srv"
}

variable "srv_elb_health_check_target" {
  description = "The target of the check"
  default     = "HTTP:80/"
}

########## General Auto Scaling variables ##########

variable "pub_ip_bool" {
  description = "Create public ip address for instance?"
  default     = "false"
}

variable "adjustment_type" {
  description = "Auto Scaling Group adjustment type"
  default     = "ChangeInCapacity"
}

variable "metric_aggregation_type" {
  description = "Auto Scaling Group metric aggregation type"
  default     = "Average"
}

variable "estimated_instance_warmup" {
  description = ""
  default     = 60
}

variable "increase_scaling_adjustment" {
  description = ""
  default     = 1
}

variable "decrease_scaling_adjustment" {
  description = ""
  default     = -1
}

variable "increase_interval_lower_bound" {
  description = ""
  default     = 0
}

variable "decrease_interval_upper_bound" {
  description = ""
  default     = 0
}

########## Custom Auto Scaling variables ##########

### Web Auto Scaling Group ###

variable "web_instance_type_ec2" {
  description = "The Instance Type."
  default     = "t2.micro"
}

variable "web_ami" {
  description = "AMI"
  default     = "ami-a4c7edb2"
}

variable "web_asg_role" {
  description = "Auto Scaling Group role"
  default     = "asg-web"
}

variable "web_min_asg_size" {
  description = "Min size of Auto Scaling Group"
  default     = 2
}

variable "web_max_asg_size" {
  description = "Max size of Auto Scaling Group"
  default     = 4
}

########## General Cloud Watch variables ##########

variable "comparison_operator" {
  description = ""
  default     = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  description = ""
  default     = 1
}

variable "cloud_watch_period" {
  description = ""
  default     = 60
}

variable "statistic_type" {
  description = ""
  default     = "Sum"
}

variable "cloud_watch_threshold" {
  description = ""
  default     = 1000
}

variable "is_actions_enabled" {
  description = ""
  default     = "true"
}

########## Custom Cloud Watch variables ##########

### Web Request Count alarm ###

variable "web_request_alarm_role" {
  description = ""
  default     = "web_request_alarm"
}

variable "web_request_alarm_metric_name" {
  description = ""
  default     = "RequestCount"
}

variable "web_request_alarm_namespace" {
  description = ""
  default     = "AWS/ELB"
}

variable "web_request_alarm_description" {
  description = ""
  default     = "Web HTTP Request alarm"
}

### Service Request Count alarm ###

variable "srv_request_alarm_role" {
  description = ""
  default     = "srv_request_alarm"
}

variable "srv_request_alarm_metric_name" {
  description = ""
  default     = "RequestCount"
}

variable "srv_request_alarm_namespace" {
  description = ""
  default     = "AWS/ELB"
}

variable "srv_request_alarm_description" {
  description = ""
  default     = "Service HTTP Request alarm"
}
