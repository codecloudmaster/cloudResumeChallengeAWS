  - ## [Tag 0.2.0](./initial_stage_0.2.0.md)  

## Tag 0.3.0

- [Terraform section](#terraform-section)
- [Usage](#usage)
- [Important notes](#important-notes)

## Diagram
![CloudResumeChallenge drawio](https://github.com/codecloudmaster/cloudResumeChallengeAWS/assets/88540356/8ba4b61b-9f6d-47a1-b981-f4969eabab38)

## Terraform section
### Prerequisites
- **Terraform Account**: While not mandatory, having a Terraform Cloud account is recommended for storing tfstate files. Terraform Cloud offers a convenient and centralized way to manage state files, allowing for collaboration and version control. Alternatively, you can choose to store state files locally or in an external backend, such as an S3 bucket.

- **AWS User**: An AWS user account with admin rights or the necessary permissions to create and manage resources. Ensure you have a valid AWS access key for this user.

### Description of Files

1. **`main.tf`**
    - This file contains blocks for Terraform Cloud configuration and required provider settings for AWS. It establishes the connection to Terraform Cloud and specifies the AWS provider details, including version.

2. **`resource-storage.tf`**
    - Configures the S3 bucket resource using the `aws_s3_bucket` and `aws_s3_bucket_policy` resources. Uploads files from the public folder to the S3 bucket using the `aws_s3_object` resource.

3. **`resource-cdn.tf`**
    - Sets up the CloudFront distribution for the S3 bucket using the `aws_cloudfront_distribution` resource. It also defines an Origin Access Identity and a local-exec provisioner for cache invalidation when new files are uploaded to the S3 bucket.

4. **`outputs.tf`**
    - This file declares output variables that provide important information after Terraform applies the configuration. For example, the CloudFront domain name, ACM certificate ARN and CNAME records that are added to the DNS zone to complete certificate validation.

5. **`variables.tf`**
    - Contains variable declarations, specifying the expected input variables for the Terraform configuration. For example, variables related to user domain, public path, and S3 bucket name. Includes validations to ensure the correctness of inputs.

6. **`terraform.tfvars.example`** (rename it to `terraform.tfvars`)
    - This file is used to set specific values for the variables declared in `variables.tf`. It allows you to customize configuration without modifying the Terraform files directly. For example, setting the user domain, public path, and S3 bucket name.

### Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/codecloudmaster/cloudResumeChallengeAWS.git
    ```

2. Navigate to the directory:
    ```bash
    cd cloudResumeChallengeAWS
    ```

3. Initialize Terraform:
    ```bash
    terraform init
    ```

4. Apply the configuration:
    ```bash
    terraform apply
    ```

5. After applying, check the outputs for important information:
    ```bash
    terraform output cloudfront_domain_name
    terraform output cloudfront_distribution_id
    terraform output acm_certificate_arn
    ```

### Important Notes
- You need to set up Terraform account if you want use it. Else - just comment section in `main.tf` related to Terraform:
  ```bash
  #cloud {
  #  organization = "ITCrowd"
  #    workspaces {
  #      name = "cloudResumeChallengeAWS"
  #    }
  #  }
    ```
- Ensure you replace values in `terraform.tfvars` with your specific configurations, such as user domain, public path, and S3 bucket name.
- Take note of the outputs, especially the CloudFront domain name, ACM certificate ARN and CNAME as they are crucial for configuring DNS records.

