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

resource "aws_instance" "prod-devopskb" {
  ami           = "ami-01cf633da373ae6f3"
  instance_type = "t2.micro"
  key_name      = "aws-web"
  vpc_security_group_ids  = [aws_security_group.prod-devopskb.id]
  # user_data     = file("init_script.sh")

# user_data = <<-EOL
  #!/bin/bash -xe
  #sudo dnf install -y epel-release
  #sudo dnf install -y python39
  #python3 -m ensurepip --upgrade --default-pip
  #pip3 install --upgrade pip
  #sudo dnf install -y java-17-openjdk-devel
# EOL

  tags = {
    Name = var.prod_name
  }

  provisioner "remote-exec" {
    inline  = [
      "sudo useradd -m -s /bin/bash ${var.users[0]}",
      "sudo usermod -aG wheel ${var.users[0]}",
      "sudo mkdir -p /home/${var.users[0]}/.ssh",
      "echo '${var.public_key}' > authorized_keys",
      "sudo cp authorized_keys /home/${var.users[0]}/.ssh/",
      "echo '${var.users[0]} ALL=(ALL) NOPASSWD: ALL' > ${var.users[0]}",
      "sudo cp ${var.users[0]} /etc/sudoers.d/",
      "sudo chmod 440 /etc/sudoers.d/${var.users[0]}",
      "sudo chown root:root /etc/sudoers.d/${var.users[0]}",
      "sudo chown -R ${var.users[0]}:${var.users[0]} /home/${var.users[0]}/.ssh",
      "sudo chmod 700 /home/${var.users[0]}/.ssh",
      "sudo chmod 600 /home/${var.users[0]}/.ssh/authorized_keys",
      "sudo dnf install -y epel-release",
      "sudo dnf install -y python39",
      "sudo python3 -m ensurepip --upgrade --default-pip",
      "sudo -s -u ${var.users[0]} pip3 install --upgrade pip",
      "sudo alternatives --set python $(which python3)",
      "sudo dnf install -y java-17-openjdk-devel"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "cloud-user"
      private_key = "${file("~/.ssh/app.pem")}"
    }
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > prod_public_ip"
  }
  provisioner "local-exec" {
    command = "echo ${self.id} > prod_id"
  }
  provisioner "local-exec" {
    command = "echo ${self.tags["Name"]} > prod_name"
  }
}

resource "aws_security_group" "prod-devopskb" {
  name        = "sec-group-${var.prod_name}"
  description = "Allow inbound traffic"
  tags = {
    Name = "prod webapp ${var.prod_name} sec-group"
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
    protocol        = -1
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

