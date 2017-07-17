# Create ELB
resource "aws_elb" "elb" {
  name            = "${var.project_name}-${var.environment}-${var.role}"
  security_groups = ["${var.security_group_ids}"]
  subnets         = ["${var.subnet_id}"]
  instances                 = ["${var.instance_id}"]
  cross_zone_load_balancing = "${var.elb_cross_zone_bool}"

  listener {
    instance_port     = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = "${var.lb_port}"
    lb_protocol       = "${var.lb_protocol}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
    target              = "${var.health_check_target}"
    interval            = "${var.health_check_interval}"
  }

  tags {
    Name    = "${var.project_name}_${var.environment}_${var.role}"
    project = "${var.project_name}"
    role    = "${var.role}"
  }
}
