- [Return to main page](../README.md)
- [Initial stage: Tag 0.2.0](./initial_stage_tag_0.2.0.md)
- [Terraform code: Tag 0.3.0](./terraform_code_tag_0.3.0.md) 
- [Cloudflare option: Tag 0.4.0](./cloudflare_tag_0.4.0.md)

## Tag 0.4.0

- [CLoudflare provider](#)
- [Usage](#usage)
- [Important notes](#important-notes)

### TO DO at this stage:
- [x] Add provider to Cloudflare
- [x] Autovalidate certificate there
- [x] Add certificate viewer to the cloudfront
- [x] Add Documentation tag 0.4.0

## Current diagram
![CloudResumeChallenge drawio](https://github.com/codecloudmaster/cloudResumeChallengeAWS/assets/88540356/8ba4b61b-9f6d-47a1-b981-f4969eabab38)

## CLoudflare provider
### Prerequisites
- **Clouflare account**: Before using this Terraform module, ensure you have a Cloudflare account. If not, you can sign up here.

- **Clouflare api token**: To authenticate Terraform with Cloudflare, you'll need to generate an API token. Follow the official documentation here.

### Description of Code

1. #### `main.tf` 
   - We added a new provider to the main.tf file - Cloudflare provider. The API token is passed as a variable to the provider section.
    ```yaml
    terraform {

        # ... rest of code  ... #

      required_providers {  

        # ... rest of code  ... #
   
      cloudflare = {
        source  = "cloudflare/cloudflare"
        version = "~> 4.0"
        }
      }
    }

      # ... rest of code  ... #
     
    provider "cloudflare" {
      api_token = var.cloudflare_api_token
    }

    ```

2. #### `resource-cloudflare.tf`
    - This file contains the Terraform code to create a Cloudflare CNAME record for ACM certificate validation. It fetches the necessary information from AWS ACM.
    ```yml
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
    ```

3. **`variables.tf`**
    - Variables are defined in this file to store Cloudflare API token.

    ```yaml
    
    variable "cloudflare_api_token" {
      description = "Token from clouflare API"
      type = string
    }
    ```
4. **`Usage`**

    Make sure to replace placeholder values in terraform.tfvars with your specific configurations, such as user domain, public path, and S3 bucket name.
    If you don't have a Terraform Cloud account, comment out the relevant section in main.tf related to Terraform Cloud.

    #### Important Notes

    You need to set up a Terraform account if you want to use Terraform Cloud. If not, comment out the Terraform Cloud section in main.tf.
    Ensure you replace values in terraform.tfvars with your specific configurations, such as user domain, public path, and S3 bucket name.
    Pay attention to the outputs, especially the CloudFront domain name, ACM certificate ARN, and CNAME, as they are crucial for configuring DNS records.





