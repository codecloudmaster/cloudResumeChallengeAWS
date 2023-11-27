locals {
  mime_types = {
    "css"  = "text/css"
    "html" = "text/html"
    "ico"  = "image/vnd.microsoft.icon"
    "js"   = "application/javascript"
    "json" = "application/json"
    "map"  = "application/json"
    "png"  = "image/png"
    "svg"  = "image/svg+xml"
    "txt"  = "text/plain"
  }
}


resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.bucket_name}"
    
  tags = {
    Domain = var.user_domain
 }
}


resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_cloudfront.json
}



data "aws_iam_policy_document" "allow_access_from_cloudfront" {
  statement {
    sid = "AllowCloudFrontServicePrincipal"
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]
    effect = "Allow"
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values = ["${aws_cloudfront_distribution.s3_distribution.arn}"]
    }
  }

}

resource "aws_s3_object" "upload_public" {
  for_each = fileset("${var.public_path}/", "*.{jpg,png,gif,css,html,js}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "${each.key}"
  source = "${var.public_path}/${each.key}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.key), length(split(".", each.key)) - 1))
  etag = filemd5("${var.public_path}/${each.key}") 
}

#resource "aws_s3_object" "upload_assets" {
#  for_each = fileset("${var.public_path}/assets/", "*.{jpg,png,gif}")
#  bucket = aws_s3_bucket.website_bucket.bucket
#  key    = "assets/${each.key}"
#  source = "${var.public_path}/assets/${each.key}"
#  
#  etag = filemd5("${var.public_path}/assets/${each.key}")
#}