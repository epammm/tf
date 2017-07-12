output "ec2_key_pair" {
  value = "${aws_key_pair.ec2_key.key_name}"
}
