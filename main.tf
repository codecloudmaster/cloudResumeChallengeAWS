terraform {
  # Configure Terraform settings for connecting to Terraform Cloud workspace
  cloud {
    organization = "ITCrowd"
      workspaces {
        name = "cloudResumeChallengeAWS"
      }
    }
  # Block for specifying required provider - AWS and version
  required_providers {  
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
   }

   cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

#provider settings for ACM
provider "aws" {
  alias = "acm"  
  region = "us-east-1"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

