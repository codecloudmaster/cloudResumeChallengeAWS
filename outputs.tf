output "bucket_name" {
    value = aws_s3_bucket.website_bucket.bucket
    
}

# Output variables for CloudFront distribution and ACM certificate
output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "Domain name for CloudFront distribution"
}

output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.s3_distribution.id
  description = "ID of the CloudFront distribution"
}

output "acm_certificate_arn" {
  value       = aws_acm_certificate.custom_domain_cert.arn
  description = "ARN of the ACM certificate for the custom domain"
}

output "aws_acm_certificate" {
  value = aws_acm_certificate.custom_domain_cert.domain_validation_options
  description = "CNAME records that are added to the DNS zone to complete certificate validation"
 
}