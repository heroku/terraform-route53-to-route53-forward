variable "root_domain" {
  type        = "string"
  description = "Domain containing the subdomain to forward."
}

variable "forward_domain" {
  type        = "string"
  description = "Domain to forward. Must be the fully qualified domain name."
}

variable "ttl" {
  type        = "string"
  default     = "600"
  description = "TTL for the NS records to be created."
}
