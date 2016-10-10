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

module "vpc" {
  source = "/Users/scott/prog/terraform/terraform-vpc-module"

  name = "${var.name}"
  region = "${var.region}"
  availability_zones = "${split(",", var.availability_zones)}"
  cidr_block = "${var.cidr_block}"
  private_subnets_per_az = "${var.private_subnets_per_az}"
  ami_ebs = "${terraform_remote_state.region.output.ami_ebs}"
  ami_hvm-ssd = "${terraform_remote_state.region.output.ami_hvm-ssd}"
}
