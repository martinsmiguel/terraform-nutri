resource "aws_eip" "bar" {
  domain = "vpc"

  instance = var.instance_id

}
