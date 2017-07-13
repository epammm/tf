output "private_subnets" {
  value = ["${aws_subnet.priv_subnets.*.id}"]
}

output "first_private_subnet" {
  value = "${aws_subnet.priv_subnets.0.id}"
}
