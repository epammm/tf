    ########## General project variables ##########

#Access key for your AWS user with programmatic access.
access_key = "YOUR ACCESS KEY"

# Secret key for your AWS user with programmatic access.
secret_key = "YOUR SECRET KEY"

# # The AWS region. Default - us-east-1
# aws_region = "us-east-1"

# Name of your project
project_name = "dream"

# # Environment type. Default - stage
# environment = "stage"

    ########## VPC variables ##########

# # The CIDR block you want the VPC to cover. Default - 10.0.0.0/16
# vpc_cidr = "10.0.0.0/16"

# # List of availability zones in which you want the public subnet. Default - "us-east-1a", "us-east-1b". 
# public_az = ["us-east-1a", "us-east-1b"]

# # List of availability zones in which you want the private subnet. Default - "us-east-1a", "us-east-1b".
# private_az = ["us-east-1a", "us-east-1b"]

# # List of CIDR blocks for public sublents. Must be a part of VPC CIDR block. Default - "10.0.1.0/24", "10.0.2.0/24"
# public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

# # List of CIDR blocks for public sublents. Must be a part of VPC CIDR block. Default - "10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"
# private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# Public part of your SSH key for connecting to AWS instances
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgQbL/DAH3im1or944+LnggMIhCehgQf38KAc4prepTMfSewbAITjJsRA7K+FcNKghSWn+kNPzSHbC8SuN/xU6YC5lJWEIPhRI6tTVByVFkkRX3KebBpI0GF/eQzrJaYcaFz+l3UQ41BdTleZ8HhroCShvhztK7RHzecSfM4IwLbWrz30A/HTpOA++x6UBLf5+7iFUWSVk7xeOshCiSCn9yruPo8ap5Hd2DDPeYtup4N6Ut2Adbg84kT2S+YUcmD3EOIl8siV8I9LAmmTC3AR5C/yGAcEayyHhISnHXVD9mwNfx5caQ/gzuM6PB6OhJMlPaGv2kUPxtYIp6yOU9Kw/ vagrant@ansible.bm"

    ########## Security groups variables ##########

    ### Bastion security group ###

# # Name of bastion security group/ Default - bastion_sg
# bastion_sg_name = "bastion_sg"


# # Description for bastion security group. Default - "Allow 22 port only"
# bastion_sg_description = "Allow 22 port only"

# # Start range port for bastion ingress rules (or certain ports). Default - 22. Variable type - list.
# bastion_start_range_ingress_port = [22]

# # End range port for bastion ingress rules (or certain ports). Default - 22. Variable type - list.
# bastion_end_range_ingress_port = [22]

# # ingress ports protocol for bastion instance. Default - tcp
# bastion_ingress_protocol = "tcp"

# List of ingress cidr blocks for ingress rules
bastion_ingress_cidr_blocks = ["213.184.243.0/24", "217.21.56.0/24", "217.21.63.0/24", "213.184.231.0/24", "86.57.255.88/29", "194.158.197.0/29"]

# # Start range port for bastion egress rules (or certain ports). Default - 0 (all ports). Variable type - list.
# bastion_start_range_egress_port = [0]

# # End range port for bastion egress rules (or certain ports). Default - 0 (all ports). Variable type - list.
# bastion_end_range_egress_port = [0]

# # Egress ports protocol for bastion instance. Default - "-1" (all protocols)
# bastion_egress_protocol = "-1"

# # List of egress cidr blocks for egress rules. Default - 0.0.0.0/0
# bastion_egress_cidr_blocks = ["0.0.0.0/0"]

    ### VPC security group ###

# Name of security group for all instances in private network. Default - vpc_sg
vpc_sg_name = "vpc_sg"

# Description for vpc security group.
vpc_sg_description = "Allow 22, 80 and 8080 ports inside private network"

# Start range port for ingress rules in private network (or certain ports). Variable type - list.
vpc_start_range_ingress_port = [22, 80, 8080]

# End range port for ingress rules in private network (or certain ports). Variable type - list.
vpc_end_range_ingress_port = [22, 80, 8080]

# # Ingress ports protocol for all instances in private network. Default - tcp
# vpc_ingress_protocol = "tcp"

# # Start range port for egress rules in private network (or certain ports). Default - 0 (all ports). Variable type - list.
# vpc_start_range_egress_port = [0]

# # End range port for egress rules in private network (or certain ports). Default - 0 (all ports). Variable type - list.
# vpc_end_range_egress_port = [0]

# # Egress ports protocol for all instances in private network. Default - "-1" (all protocols)
# vpc_egress_protocol = "-1"

# # List of egress cidr blocks for all instances in private network
# vpc_egress_cidr_blocks = ["0.0.0.0/0"]

    ### ELB security group ###

# # Name of security group for ELB. Defaul - "elb_sg".
# elb_sg_name = "elb_sg"

# # Description for ELB security group. Default - "Allow 80 and 443 ports only".
# elb_sg_description = "Allow 80 and 443 ports only"

# # Start range port for ELB ingress rules (or certain ports). Default - 80, 443. Variable type - list.
# elb_start_range_ingress_port = [80, 443]

# # End range port for ELB ingress rules (or certain ports). Default - 80, 443. Variable type - list.
# elb_end_range_ingress_port = [80, 443]

# # Ingress ports protocol for ELB. Default - "tcp"
# elb_ingress_protocol = "tcp"

# # List of ingress cidr blocks for ELB egress rules. Default - 0.0.0.0/0
# elb_ingress_cidr_blocks = ["0.0.0.0/0"]

# #Start range port for ELB egress rules (or certain ports). Default - 0 (all ports). Variable type - list.
# elb_start_range_egress_port = [0]

# # End range port for ELB egress rules (or certain ports). Default - 0 (all ports). Variable type - list.
# elb_end_range_egress_port = [0]

# # egress ports protocol for ELB. Default - "-1" (all protocols)
# elb_egress_protocol = "-1"

# # List of egress cidr blocks for ELB. Default - 0.0.0.0/0
# elb_egress_cidr_blocks = ["0.0.0.0/0"]


    ########## Custom instances variables ##########

    ### Bastion instance ###

# # AWS AMI for bastion instance. Default - ami-a4c7edb2
# bastion_ami = "ami-a4c7edb2"

# # The Instance Type for bastion instance. Default - t2.micro
# bastion_instance_type_ec2 = "t2.micro"

    ### Jenkins server ###

# # Number of instance for Jenkins server. Default - 1
# jenkins_instance_count = 1

# # AWS AMI for Jenkins server. Default ami-a4c7edb2
# jenkins_ami = "ami-a4c7edb2"

# The Instance Type for Jenkins server.
jenkins_instance_type_ec2 = "t2.micro" 

    ### ELK server ###

# # Number of instance for ELK server. Default - 1
# elk_instance_count = 1

# # AWS AMI for ELK server. Default ami-a4c7edb2
# elk_ami = "ami-a4c7edb2"

# The Instance Type for ELK server.
elk_instance_type_ec2 = "t2.medium" 



