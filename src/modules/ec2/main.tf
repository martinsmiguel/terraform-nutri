resource "aws_instance" "web" {
  ami           = "ami-0cdc2f24b2f67ea17"
  instance_type = "t2.micro"
}