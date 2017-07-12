resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.project_name}_${var.environment}"
  public_key = "${var.public_key}"
}
