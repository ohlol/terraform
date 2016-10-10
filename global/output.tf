output "dns_domain" {
  value = "${var.global_dns_domain}"
}

output "ec2_readonly_role" {
  value = "${aws_iam_role.ec2_readonly.name}"
}

output "route53_zone_id" {
  value = "${aws_route53_zone.global.zone_id}"
}

output "route53_zone_ns" {
  value = "${join(",", aws_route53_zone.global.name_servers)}"
}
