data "cloudflare_zone" "codecloudmaster" {
  name = var.user_domain
}


# Convert the set to a list
locals {
  validation_options_list = tolist(aws_acm_certificate.custom_domain_cert.domain_validation_options)
  
  # Get the first DNS record from domain_validation_options
  first_validation_option = element(local.validation_options_list, 0)
}


# Create Cloudflare CNAME records for ACM validation
resource "cloudflare_record" "codecloudmaster" { 
  allow_overwrite = false
  zone_id = data.cloudflare_zone.codecloudmaster.id
  name    = local.first_validation_option.resource_record_name
  value   = local.first_validation_option.resource_record_value
  type    = "CNAME"
  proxied = false
}

