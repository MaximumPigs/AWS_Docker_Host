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
  key_name      = "MaximumPigs_Key_Pair"
}