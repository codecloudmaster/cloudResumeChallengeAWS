terraform {

  cloud {
    organization = "ITCrowd"
      workspaces {
        name = "cloudResumeChallengeAWS"
      }
    }

  required_providers {  
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
   }
  }
}

