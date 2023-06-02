terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
  backend "s3" {
    bucket         = "backend1205"
    key            = "dev/terraform.tfstate"
    dynamodb_table = "statelock"
    region         = "eu-west-2"

  }
}

provider "aws" {
  # Configuration options
}