data "aws_key_pair" "nutri" {
  key_name           = var.key_name
  include_public_key = true
}
