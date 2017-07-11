# Create public subnets
resource "aws_subnet" "pub_subnets" {
  count             = "${length(var.subnets)}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(var.subnets, count.index)}"
  availability_zone = "${element(var.az, count.index)}"

  tags {
    Name    = "${var.project_name}_${var.environment}_public_${count.index}"
    project = "${var.project_name}"
    role    = "subnet_public_${count.index}"
  }
}

# Create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name    = "${var.project_name}_${var.environment}"
    project = "${var.project_name}"
    role    = "igw"
  }
}

# Create the public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name    = "${var.project_name}_${var.environment}_public"
    project = "${var.project_name}"
  }
}

# Create public route
resource "aws_route" "public_route" {
  route_table_id         = "${aws_route_table.public_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

# Associate public subnets to public route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = "${element(aws_subnet.pub_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.public_route_table.id}"
  count          = "${length(var.subnets)}"
}
