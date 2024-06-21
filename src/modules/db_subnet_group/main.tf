resource "aws_db_subnet_group" "nutri" {
  name       = "nutri"
  subnet_ids = var.private_subnet_ids

  tags = merge({
    Name = "nutri_private_subnet_group"
  }, var.tags)
}
