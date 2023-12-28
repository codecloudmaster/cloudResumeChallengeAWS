## Table of Contents

### [About The Cloud Resume Challenge](#about-the-cloud-resume-challenge)
### [My Challenge](#my-challenge)
  - [Recent Diagram Related to Progress](#recent-diagram-related-to-progress)
  - [Prerequisites](#prerequisites)
  - [Important Notes](#important-notes)
  - [Usage](#usage)
  

# About The Cloud Resume Challenge
The Cloud Resume Challenge is a project created by Forrest Brazeal, a cloud advocate, and AWS Community Hero. It is designed to help people learn and showcase their skills in cloud computing, particularly with Amazon Web Services (AWS). The challenge involves creating a resume-style website and deploying it on AWS, using services such as Amazon S3, Amazon DynamoDB, AWS Lambda, and more.

- [Original Website](https://cloudresumechallenge.dev/)
- [Cloud Resume Challenge Prerequisites](docs/README.md)
- [My Documentation](docs/initial_stage_tag_0.2.0.md)



# About what this project - The Cloud Resume Challenge

The Cloud Resume Challenge is a project created by Forrest Brazeal, a cloud advocate and AWS Community Hero. It is designed to help people learn and showcase their skills in cloud computing, particularly with Amazon Web Services (AWS).
The challenge involves creating a resume-style website and deploying it on AWS. Participants are encouraged to use AWS services like Amazon S3 for hosting static content, Amazon DynamoDB for storing data, AWS Lambda for serverless functions, and more. The idea is to demonstrate technical skills and gain practical experience by building a real-world project.

[Original website](https://cloudresumechallenge.dev/)

[Cloud Resume Challenge Prerequirements](docs/README.md)

[My documentation](docs/initial_stage_tag_0.2.0.md)



## My Challenge

For work on this project, I decided to use Terraform for creating all resources in the AWS Cloud, as an additional challenge. Also I will use Gitpod as workspace.

## Recent diagram related to the progress  

![CloudResumeChallenge drawio](https://github.com/codecloudmaster/cloudResumeChallengeAWS/assets/88540356/959c2cd0-64bf-4acf-b675-17224f3c6ba1)

### Prerequisites

- **Terraform Account**: While not mandatory, having a Terraform Cloud account is recommended for storing tfstate files. Terraform Cloud offers a convenient and centralized way to manage state files, allowing for collaboration and version control. Alternatively, you can choose to store state files locally or in an external backend, such as an S3 bucket.

- **AWS User**: An AWS user account with admin rights or the necessary permissions to create and manage resources. Ensure you have a valid AWS access key for this user.

- **Clouflare account**: Before using this Terraform module, ensure you have a Cloudflare account. If not, you can sign up here.

- **Clouflare api token**: To authenticate Terraform with Cloudflare, you'll need to generate an API token. Follow the official documentation here.

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
    terraform output cloudfront_domain_name #Domain name for CloudFront distribution
    terraform output cloudfront_distribution_id #ID of the CloudFront distribution
    terraform output acm_certificate_arn #ARN of the ACM certificate for the custom domain
    terraform output aws_acm_certificate # CNAME records that are added to the DNS zone to complete certificate validation
    ```
