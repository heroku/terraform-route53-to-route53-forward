# Route53 to Route53 NS forwarding terraform module

Terraform module which creates a hosted zone in AWS Route 53, and NS records in another, preexisting route53 zone, used to to forward DNS requests for a given domain to the new hosted zone.

Uses two instances of the [AWS Provider](https://www.terraform.io/docs/providers/aws/).

## Usage

AWS providers named "root" and "child" must be passed explicitly to this module.
Here is an example:

```hcl
provider aws {}

provider aws {}
  alias "dns-root"
  access_key = "..."
  secret_access_key = "..."
}

module "forward-zone" {
  source = "github.com/heroku/terraform-route53-to-route53-forward"
  forward_domain = "forward.me.mydomain.com"
  root_domain = "mydomain.com"

  providers {
    aws.child = "aws"
    aws.root  = "aws.dns-root"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| forward_domain | Domain to forward. Must be the fully qualified domain name. | string | - | yes |
| root_domain | Domain containing the subdomain to forward. | string | - | yes |
| ttl | TTL for the NS records to be created. | string | `600` | no |

## Outputs

| Name | Description |
|------|-------------|
| name_servers | Nameservers for the route53 zone |
| zone_id | ID of the route53 zone |
