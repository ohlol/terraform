output "ami_ebs" {
  value = "${var.ami_ebs}"
}

output "ami_hvm-ssd" {
  value = "${var.ami_hvm-ssd}"
}

output "dns_domain" {
  value = "${module.aws_region.dns_domain}"
}

output "route53_zone_id" {
  value = "${module.aws_region.route53_zone_id}"
}

output "route53_zone_ns" {
  value = "${module.aws_region.route53_zone_ns}"
}
