output "asg_name" {
  value = "${aws_autoscaling_group.asg.name}"
}

output "asg_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "increase_policy" {
  value = "${aws_autoscaling_policy.increase.arn}"
}

output "decrease_policy" {
  value = "${aws_autoscaling_policy.decrease.arn}"
}
