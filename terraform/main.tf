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
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name      = "aws-web"
  vpc_security_group_ids  = [sg-0b91374a598a160c5,sg-0493ee599c4918dcc]

  tags = {
    Name = var.instance_name
  }
}
