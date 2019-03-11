resource "aws_instance" "main" {
  ami = "ami-00035f41c82244dab"
  instance_type = "t3.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["deploypreviewsg"]

  provisioner "local-exec" {
    command = "ls -la ../ssh/deploy-preview.pem"
  }
  provisioner "remote-exec" {
    inline = ["sleep 10"]
    connection {
      user = "ubuntu"
      private_key = "${file("../ssh/deploy-preview.pem")}"
      type = "ssh"
      agent = "false"
    }
  }
}

resource "aws_key_pair" "deployer" {
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIxzAeSe0n+AKiq7JIx2nQBw0mwtz4xgbrOiI1RzAL+Jd9eV7srpzk8zphj1cR7oNb2ZwXh55KGXiJh5Nq+iqKdJZs6Ppvsahol7+Sq7qr9clF0bZpuZ5epNonCf0hSCr8d8zLpQI6d4TOMS34XxTW/QqXCEOpHVjDJTWkGdAkKcMPy0tJJNMQVGZl2I/H7iJLM9Vz6LIADYZxzqhTFcbquCt+E0k2No8W48lKstTBW6qBvUGhWJdQbN0EjSwHDfHlxSmSvf3Jcqeyl8b4Do8sQzPWX512obhtDXPNEn76PYtirUMgfQ6V38yJ34BmzL6HGK/gicbMGNsRkVfLH00B acube@jensener.home"
}

output "public_dns" {
  value = "${aws_instance.main.public_dns}"
}

variable "aws_access_key"   {}

variable "aws_secret_key" {}

provider "aws" {
  region = "eu-west-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}
