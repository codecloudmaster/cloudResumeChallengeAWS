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
  }
}

