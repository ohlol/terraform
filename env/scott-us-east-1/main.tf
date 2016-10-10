provider "aws" {
  region = "${var.region}"
}

resource "terraform_remote_state" "region" {
  backend = "s3"
  config = {
    bucket = "scott"
    key = "terraform/region/${var.region}.tfstate"
    region = "us-east-1"
  }
}

resource "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "scott"
    key = "terraform/vpc/dev-${var.region}.tfstate"
    region = "us-east-1"
  }
}
