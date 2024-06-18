resource "aws_instance" "web" {
  ami           = "ami-04716897be83e3f04"
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]
  key_name      = var.key_name

  tags = merge({
    Name = "Nutri prod"
  }, var.tags)
}
