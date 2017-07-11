output "private_subnets" {
  value = ["${aws_subnet.priv_subnets.*.id}"]
}
