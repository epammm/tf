# Create EIP for NATGW
resource "aws_eip" "eip" {
  vpc = true
}
