resource "tls_private_key" "terraform" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "random_string" "key_name" {
  length  = 8
  special = false
}

resource "aws_key_pair" "generated_key" {
  name       = random_string.key_name.result
  public_key = tls_private_key.terraform.public_key_openssh
}