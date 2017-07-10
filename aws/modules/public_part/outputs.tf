output "nat_public_subnet" {
  value = "${aws_subnet.subnets.0.id}"
}
