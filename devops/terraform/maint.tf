resource "aws_instance" "main" {
  ami = "ami-00035f41c82244dab"
  instance_type = "t3.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deploy-preview-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIxzAeSe0n+AKiq7JIx2nQBw0mwtz4xgbrOiI1RzAL+Jd9eV7srpzk8zphj1cR7oNb2ZwXh55KGXiJh5Nq+iqKdJZs6Ppvsahol7+Sq7qr9clF0bZpuZ5epNonCf0hSCr8d8zLpQI6d4TOMS34XxTW/QqXCEOpHVjDJTWkGdAkKcMPy0tJJNMQVGZl2I/H7iJLM9Vz6LIADYZxzqhTFcbquCt+E0k2No8W48lKstTBW6qBvUGhWJdQbN0EjSwHDfHlxSmSvf3Jcqeyl8b4Do8sQzPWX512obhtDXPNEn76PYtirUMgfQ6V38yJ34BmzL6HGK/gicbMGNsRkVfLH00B acube@jensener.home"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  region = "eu-west-1"
  access_key = "${aws_access_key}"
  secret_key = "${aws_secret_key}"
}