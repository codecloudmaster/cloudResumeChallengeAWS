# Define a local variable for CloudFront S3 origin ID
locals {
  s3_origin_id = "OriginIDFor_${aws_s3_bucket.website_bucket.bucket}_Bucket"
}

# Create a CloudFront Origin Access Identity
resource "aws_cloudfront_origin_access_identity" "default" {
  comment = "AWS CloudFront identity for S3"
}

# Create a CloudFront Origin Access Control for S3
resource "aws_cloudfront_origin_access_control" "default" {
  name                              = "OAC ${aws_s3_bucket.website_bucket.id}"
  description                       = "OAC ${aws_s3_bucket.website_bucket.id} policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Create an ACM certificate for the custom domain
resource "aws_acm_certificate" "custom_domain_cert" {
  provider = aws.acm

  domain_name       = var.user_domain
  subject_alternative_names = ["*.${var.user_domain}"]
  validation_method = "DNS"
  
  lifecycle {
    create_before_destroy = true
  }
}

# Wait for ACM certificate validation to complete
resource "null_resource" "wait_for_validation" {
  depends_on = [aws_acm_certificate.custom_domain_cert]

  provisioner "local-exec" {
    command = "sleep 300"  # Adjust the sleep duration as needed
  }
}

# Create a CloudFront Distribution
resource "aws_cloudfront_distribution" "s3_distribution" {
  depends_on = [null_resource.wait_for_validation]

  origin {
    domain_name              = aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static website hosting for: ${aws_s3_bucket.website_bucket.id}"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Domain = var.user_domain
  }

 viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.custom_domain_cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  aliases = [var.user_domain]
}

# Create a local-exec provisioner for cache invalidation upon file changes
resource "terraform_data" "invalidate_cache" {
  for_each = fileset("${var.public_path}/", "*.{jpg,png,gig,css,html,js}")

  triggers_replace = {
    for file in fileset("${var.public_path}/", "*.{jpg,png,gig,css,html,js}") : file => md5(file("${var.public_path}/${file}"))
  }

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.s3_distribution.id} --paths '/*'"
  }
}


