locals {
  forward_name1 = replace(var.forward_domain, var.root_domain, "")
  forward_name  = substr(local.forward_name1, 0, length(local.forward_name1) - 1)
}

data "aws_route53_zone" "root" {
  name     = "${var.root_domain}."
  provider = aws.root
  # Note: Force destroy shouldn't ever be needed in the root zone for our purposes.
}

resource "aws_route53_zone" "main" {
  name          = var.forward_domain
  force_destroy = var.force_destroy
  tags          = var.tags
}

resource "aws_route53_record" "forward" {
  provider = aws.root
  name     = local.forward_name
  records  = aws_route53_zone.main.name_servers
  ttl      = var.ttl
  type     = "NS"
  zone_id  = data.aws_route53_zone.root.zone_id
}

