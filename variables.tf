variable "root_domain" {
  type        = string
  description = "Domain containing the subdomain to forward."
}

variable "forward_domain" {
  type        = string
  description = "Domain to forward. Must be the fully qualified domain name."
}

variable "ttl" {
  type        = string
  default     = "600"
  description = "(Optional, Default:600) TTL for the NS records to be created."
}

variable "force_destroy" {
  description = "(Optional, Default:false) A boolean that indicates all domains should be deleted from the zone so it can be destroyed without error."
  default     = "false"
}

variable "tags" {
  description = "(Optional, Default: {}) A map of tags to be added to the zone created."
  default = {
    Managed = "terraform"
  }
}

