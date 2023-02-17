terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    region = "ap-southeast-2"
    bucket = "terraform-backend-maximumpigs"
    key    = "state/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0692dea0a2f8a1b35"
  instance_type = "t2.micro"
  key_name      = var.key_pair

  tags = {
    "name" = "Honeypot"
  }

  network_interface {
    network_interface_id = aws_network_interface.honeypot_nic
    device_index         = 0
  }
}

resource "aws_network_interface" "honeypot_nic" {
  subnet_id       = aws_subnet.subnet.id
  private_ip      = "10.0.0.100"
  security_groups = ["${aws_security_group.security_group.id}"]

  tags = {
    "name" = "primary_network_interface"
  }
}

resource "aws_eip" "public" {
  depends_on = [
    aws_internet_gateway.gw,
    aws_network_interface.honeypot_nic
  ]

  network_interface         = aws_network_interface.honeypot_nic
  associate_with_private_ip = aws_network_interface.honeypot_nic.private_ip
  vpc                       = true
}

output "public_ip" {
  value = aws_eip.public.public_ip
}