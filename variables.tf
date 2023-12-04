# Variable for user domain
variable "user_domain" {
  type        = string
  description = "My domain"
  
  # Validation to ensure the user_domain is not an empty string
  validation {
    condition     = length(var.user_domain) > 0
    error_message = "User Domain cannot be an empty string"
  }
}

# Variable for the path to the assets folder
variable "public_path" {
  description = "Path to assets folder"
  type        = string
}

# Variable for the name of the S3 bucket
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  # Validation to ensure the bucket_name is not an empty string and has a length greater than 3
  validation {
    condition     = length(var.bucket_name) > 3 
    error_message = "Bucket name cannot be an empty string and must have a length greater than 3"
  }
}
