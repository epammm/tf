output "nat_public_subnet" {
  value = "${aws_subnet.pub_subnets.0.id}"
}
