resource "aws_launch_configuration" "as_conf" {
  name                        = "${var.project_name}-${var.environment}-${var.role}"
  image_id                    = "${var.image_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_group_ids}"]
  associate_public_ip_address = "${var.pub_ip_bool}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.project_name}-${var.environment}-${var.role}"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  vpc_zone_identifier  = ["${var.subnet_id}"]
  min_size             = "${var.min_asg_size}"
  max_size             = "${var.max_asg_size}"
  load_balancers       = ["${var.load_balancers_name}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-${var.role}"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "increase" {
  name                      = "${var.project_name}-${var.environment}-${var.role}-increase"
  autoscaling_group_name    = "${aws_autoscaling_group.asg.name}"
  adjustment_type           = "${var.adjustment_type}"
  policy_type               = "StepScaling"
  metric_aggregation_type   = "${var.metric_aggregation_type}"
  estimated_instance_warmup = "${var.estimated_instance_warmup}"

  step_adjustment {
    scaling_adjustment          = "${var.increase_scaling_adjustment}"
    metric_interval_lower_bound = "${var.increase_interval_lower_bound}"
  }
}

resource "aws_autoscaling_policy" "decrease" {
  name                      = "${var.project_name}-${var.environment}-${var.role}-decrease"
  autoscaling_group_name    = "${aws_autoscaling_group.asg.name}"
  adjustment_type           = "${var.adjustment_type}"
  policy_type               = "StepScaling"
  metric_aggregation_type   = "${var.metric_aggregation_type}"
  estimated_instance_warmup = "${var.estimated_instance_warmup}"

  step_adjustment {
    scaling_adjustment          = "${var.decrease_scaling_adjustment}"
    metric_interval_upper_bound = "${var.decrease_interval_upper_bound}"
  }
}
