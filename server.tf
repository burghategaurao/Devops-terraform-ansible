terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "gaurao-apiserver" {
  ami = "ami-05842f1afbf311a43"
  instance_type = "t2.micro"
  key_name = "gb-jenkins"

  tags = {
    Name = "gaurao-apiserver"
    env = "Production"
    owner = "gaurao-apiserver"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

