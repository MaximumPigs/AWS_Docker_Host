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
  region     = "ap-southeast-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}