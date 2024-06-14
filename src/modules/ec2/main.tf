resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Atualizar
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]

  tags = merge({
    Name = "Nutri prod"
  }, var.tags)
}