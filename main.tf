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
    network_interface_id = aws_network_interface.honetpot_nic.id
    device_index         = 0
  }
}

resource "aws_network_interface" "honetpot_nic" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["10.0.0.100"]

  tags = {
    "name" = "primary_network_interface"
  }
}