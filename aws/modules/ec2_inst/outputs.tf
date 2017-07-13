output "instance_priv_ip" {
  value = ["${aws_instance.ec2.*.private_ip}"]
}

output "instance_priv_dns" {
  value = ["${aws_instance.ec2.*.private_dns}"]
}

output "instance_id" {
  value = ["${aws_instance.ec2.*.id}"]
}
