##main.tf
provider "aws" {
  region = "ap-southeast-2"
}

provider "tls" {

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
}

resource "aws_key_pair" "demo-key-pair" {
  key_name   = "yulei-demo-key-oss-local"
  public_key = tls_private_key.tlskey.public_key_openssh
}

resource "aws_instance" "demo-ec2-instance-with-key" {
  ami                         = data.aws_ami.ubuntu.id
  key_name                    = aws_key_pair.demo-key-pair.key_name
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name    = "demo-ec2-instance-with-key"
    TTL     = 168
    Owner   = "yulei@hashicorp.com"
    Purpose = "demo for terraform oss triggered by github actions with s3 backend"
  }
}

output "private_key" {
  value     = tls_private_key.tlskey.private_key_pem
  sensitive = true
}

output "public_key" {
  value = tls_private_key.tlskey.public_key_openssh
}
