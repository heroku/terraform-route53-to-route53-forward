output "name_servers" {
  description = "Nameservers for the route53 zone"
  value       = "${aws_route53_zone.main.name_servers}"
}

output "zone_id" {
  description = "ID of the route53 zone"
  value       = "${aws_route53_zone.main.id}"
}
