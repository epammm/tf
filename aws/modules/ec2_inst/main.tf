# Create 'ec2' instance
resource "aws_instance" "ec2" {
  count         = "${var.instance_count}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  subnet_id     = "${element(var.subnet_id, count.index)}"

  #user_data                   = "${var.user_data}"
  availability_zone           = "${element(var.az, count.index)}"
  associate_public_ip_address = "${var.pub_ip_bool}"
  vpc_security_group_ids      = ["${var.security_group_ids}"]

  tags {
    Name    = "${var.project_name}_${var.environment}_${var.role}-${format("%03d", count.index + 1)}"
    project = "${var.project_name}"
    role    = "${var.role}"
  }
}
