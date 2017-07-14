resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = "${var.project_name}-${var.environment}-${var.role}"
  comparison_operator = "${var.comparison_operator}"
  evaluation_periods  = "${var.evaluation_periods}"
  metric_name         = "${var.metric_name}"
  namespace           = "${var.namespace}"
  period              = "${var.cloud_watch_period}"
  statistic           = "${var.statistic_type}"
  threshold           = "${var.cloud_watch_threshold}"
  actions_enabled     = "${var.is_actions_enabled}"

  dimensions {
    LoadBalancerName = "${var.elb_name}"
  }

  alarm_description = "${var.alarm_description}"
  alarm_actions     = ["${var.alarm_actions}"]
  ok_actions        = ["${var.ok_actions}"]
}
