resource "aws_route53_zone" "dns_zone" {
  name = "maximumpigs.com"
}

resource "aws_route53_record" "maximumpigs" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "maximumpigs.com"
  type    = "A"
  ttl     = 30
  records = [aws_eip.public.public_ip]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "www"
  type    = "CNAME"
  ttl     = 30
  records = [aws_route53_record.maximumpigs.name]
}