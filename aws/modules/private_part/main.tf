# Create private subnets
resource "aws_subnet" "priv_subnets" {
  count             = "${length(var.subnets)}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(var.subnets, count.index)}"
  availability_zone = "${element(var.az, count.index)}"

  tags {
    Name    = "${var.project_name}_${var.environment}_private_${count.index}"
    project = "${var.project_name}"
    role    = "subnet_private_${count.index}"
  }
}

# Create NAT GateWay
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${var.eip_id}"
  subnet_id     = "${var.nat_public_subnet}"
}

# Create the private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name    = "${var.project_name}_${var.environment}_private"
    project = "${var.project_name}"
  }
}

# Create private route
resource "aws_route" "private_route" {
  route_table_id         = "${aws_route_table.private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat_gw.id}"
}

# Associate private subnets to private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = "${element(aws_subnet.priv_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.private_route_table.id}"
  count          = "${length(var.subnets)}"
}
