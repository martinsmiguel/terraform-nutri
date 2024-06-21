resource "aws_db_instance" "nutri" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.2"
  identifier           = "nutri"
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.subnet_group_name
  skip_final_snapshot  = true

  tags = merge({
    Name = "MyRDSInstance"
  }, var.tags)
}


