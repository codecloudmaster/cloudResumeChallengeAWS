variable "user_domain" {
  type        = string
  description = "My domain"
  
  validation {
    condition     = length(var.user_domain) > 0
    error_message = "User Domain cannot be an empty string"
  }
  
}

#variable "content_version" {
#  description = "The content version. Should be a positive integer starting at 1."
#  type = number
#
#  validation {
#    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
#    error_message = "The content_version must be a positive integer starting at 1."
#  }
#}

variable "public_path" {
  description = "Path to assets folder"
  type = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type = string

  validation {
    condition     = length(var.bucket_name) > 3 
    error_message = "Bucket name cannot be an empty string"
  }
}