terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "ap-southeast-2"
    bucket = "terraform-backend-maximumpigs"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  access_key = var.access_key
  secret_key = var.secret_key
}