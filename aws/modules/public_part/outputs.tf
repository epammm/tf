output "nat_public_subnet" {
  value = "${aws_subnet.pub_subnets.0.id}"
}

output "public_subnets" {
  value = ["${aws_subnet.pub_subnets.*.id}"]
}
