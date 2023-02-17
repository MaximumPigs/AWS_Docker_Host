resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    "name" = "honeypot_vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    "name" = "honeypot_subnet"
  }
}

resource "aws_security_group" "security_group" {
  name        = "honeypot_security_group"
  description = "firewall rules for honeypot"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    cidr_blocks = ["${var.my_ip}/32"]
    to_port     = 22
    protocol    = "ssh"
  }

  egress {
    description = "all outbound"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = -1
  }
}