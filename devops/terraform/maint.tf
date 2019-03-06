resource "aws_instance" "main" {
  ami = "ami-00035f41c82244dab"
  instance_type = "t3.micro"
}