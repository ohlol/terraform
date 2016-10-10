resource "aws_route53_zone" "global" {
  name = "${var.global_dns_domain}"
}
