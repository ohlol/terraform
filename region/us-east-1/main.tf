provider "aws" {
  region = "${var.region}"
}

module "aws_region" {
  source = "/Users/scott/prog/terraform/terraform-aws_region-module"

  region = "${var.region}"
}
