resource "aws_route53_zone" "dns_zone" {
  name = "maximumpigs.com"
}

resource "aws_route53_record" "maximumpigs" {
  for_each = var.routes
  zone_id  = aws_route53_zone.dns_zone.id
  name     = each.value.name
  type     = each.value.type
  ttl      = "30"
  records  = each.value.records
}