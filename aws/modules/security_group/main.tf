# Create security group
resource "aws_security_group" "security_group" {
  name        = "${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name    = "${var.project_name}_${var.environment}_${var.sg_name}"
    project = "${var.project_name}"
    role    = "sg"
  }
}

#Create ingress rules for the security group
resource "aws_security_group_rule" "ingress_rules" {
  security_group_id = "${aws_security_group.security_group.id}"
  count             = "${length(var.start_range_ingress_port)}"
  from_port         = "${element(var.start_range_ingress_port, count.index)}"
  to_port           = "${element(var.end_range_ingress_port, count.index)}"
  protocol          = "${var.ingress_protocol}"
  cidr_blocks       = "${var.ingress_cidr_blocks}"
  type              = "ingress"
}

#Create egress rules for the security group
resource "aws_security_group_rule" "egress_rules" {
  security_group_id = "${aws_security_group.security_group.id}"
  count             = "${length(var.start_range_egress_port)}"
  from_port         = "${element(var.start_range_egress_port, count.index)}"
  to_port           = "${element(var.end_range_egress_port, count.index)}"
  protocol          = "${var.egress_protocol}"
  cidr_blocks       = "${var.egress_cidr_blocks}"
  type              = "egress"
}
