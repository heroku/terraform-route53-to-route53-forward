output "name_servers" {
  description = "Nameservers for the new, child route53 zone"
  value       = "${aws_route53_zone.main.name_servers}"
}

output "zone_id" {
  description = "ID of the new, child route53 zone"
  value       = "${aws_route53_zone.main.id}"
}
