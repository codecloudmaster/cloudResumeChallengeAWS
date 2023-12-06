data "cloudflare_zone" "codecloudmaster" {
  name = var.user_domain
}

resource "cloudflare_record" "codecloudmaster" {
  
  
  for_each = {
    for dvo in aws_acm_certificate.custom_domain_cert.domain_validation_options : dvo.domain_name => {
      name    = dvo.resource_record_name
      record  = dvo.resource_record_value[0]  # Assuming you want the first record value
    }
  }
  
  zone_id = data.cloudflare_zone.codecloudmaster.id
  name    = each.value.name
  value   = each.value.record
  type    = "CNAME"
  proxied = false
}