# Create a new load balancer attachment
resource "aws_elb_attachment" "elb_attach" {
  elb      = "${var.elb_id}"
  instance = "${var.instance_id}"
}
