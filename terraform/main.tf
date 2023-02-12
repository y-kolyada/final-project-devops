terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "web-04" {
  ami           = "ami-01cf633da373ae6f3"
  instance_type = "t2.micro"
  key_name      = "aws-web"
  vpc_security_group_ids  = [aws_security_group.allow_webapp.id]

  tags = {
    Name = var.instance_name
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > public_ip.txt"
  }
}

resource "aws_security_group" "allow_webapp" {
  name        = "sec-group-webapp"
  description = "Allow inbound traffic"
  tags = {
    Name = "webapp web-04 sec-group"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

