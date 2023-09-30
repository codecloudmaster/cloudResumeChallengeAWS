- [Cloud Resume Challenge Requirements](#cloud-resume-challenge-requirements)
  * [1. Certification - Prove Your AWS Knowledge](#1-certification---prove-your-aws-knowledge)
  * [2. HTML - Structured Content](#2-html---structured-content)
  * [3. CSS - Stylish Presentation](#3-css---stylish-presentation)
  * [4. Static Website - AWS S3 Hosting](#4-static-website---aws-s3-hosting)
  * [5. HTTPS - Secure Your Site](#5-https---secure-your-site)
  * [6. DNS - Custom Domain](#6-dns---custom-domain)
  * [7. JavaScript - Visitor Counter](#7-javascript---visitor-counter)
  * [8. Database - Amazon DynamoDB](#8-database---amazon-dynamodb)
  * [9. API - AWS API Gateway and Lambda](#9-api---aws-api-gateway-and-lambda)
  * [10. Python - Lambda Function](#10-python---lambda-function)
  * [11. Tests - Python Code Testing](#11-tests---python-code-testing)
  * [12. Infrastructure as Code (IaC) - AWS SAM or Terraform](#12-infrastructure-as-code--iac----aws-sam-or-terraform)
  * [13. Source Control - GitHub Repository](#13-source-control---github-repository)
  * [14. CI/CD (Back end) - Automate Deployments](#14-ci-cd--back-end----automate-deployments)
  * [15. CI/CD (Front end) - Keep Your Site Updated](#15-ci-cd--front-end----keep-your-site-updated)
  * [16. Blog Post - Share Your Journey](#16-blog-post---share-your-journey)


# Cloud Resume Challenge Requirements

Welcome to the Cloud Resume Challenge! This GitHub repository is your gateway to mastering cloud technologies and enhancing your resume. Below, you'll find a concise breakdown of the key requirements and best practices for completing this challenge.

## 1. Certification - Prove Your AWS Knowledge

To start, your resume must showcase the **AWS Cloud Practitioner certification**. While more advanced AWS certifications are impressive, the Cloud Practitioner certification provides a solid foundation. You can take this exam online for $100 USD through [AWS Training and Certification](https://aws.amazon.com/certification/).

## 2. HTML - Structured Content

Craft your resume using **HTML**, not conventional document formats like Word or PDF. Here's an [example HTML resume](https://codepen.io/emzarts/pen/OXzmym) to get you started.

## 3. CSS - Stylish Presentation

Apply **CSS** to style your resume. While it doesn't need to be extravagant, a polished appearance is essential to make your resume stand out.
[CSS Tutorial](https://www.w3schools.com/css/default.asp)

## 4. Static Website - AWS S3 Hosting

Host your HTML resume as a **static website** using **Amazon S3**. AWS S3 provides a reliable and cost-effective platform for web hosting.

## 5. HTTPS - Secure Your Site

Ensure your S3 website URL uses **HTTPS** for security. You'll achieve this by integrating **Amazon CloudFront**, which provides content delivery and HTTPS capabilities.

## 6. DNS - Custom Domain

Give your resume a professional touch by pointing a **custom DNS domain name** to your CloudFront distribution. Services like **Amazon Route 53** can assist in domain management.

## 7. JavaScript - Visitor Counter

Enhance user experience by implementing a **visitor counter** on your resume webpage. This requires writing a bit of **JavaScript**. Here's a [helpful tutorial](https://www.w3schools.com/js/js_htmldom.asp) to get you started.

## 8. Database - Amazon DynamoDB

Manage your visitor counter's data using **Amazon DynamoDB**, a NoSQL database service. Opt for on-demand pricing to keep costs minimal. Access a [free DynamoDB course](https://aws.amazon.com/dynamodb/getting-started/).

## 9. API - AWS API Gateway and Lambda

Create an **API** to mediate interactions between your web app and the database. Utilize **AWS API Gateway** and **AWS Lambda** for this purpose. AWS offers cost-effective solutions for our requirements.

## 10. Python - Lambda Function

While you can use JavaScript for the Lambda function, it's advisable to explore **Python**, a common language for backend programming. AWS SDK for Python (**boto3**) simplifies AWS integration. Here's a [free Python tutorial](https://www.learnpython.org/){:target="_blank"}.

## 11. Tests - Python Code Testing

Include robust **tests** for your Python code to ensure reliability and accuracy. Learn about writing effective Python tests [here](https://docs.python-guide.org/writing/tests/).

## 12. Infrastructure as Code (IaC) - AWS SAM or Terraform

For efficient resource management, define your AWS resources, including DynamoDB tables, API Gateway, and Lambda functions, in an **AWS Serverless Application Model (SAM)** template. Deploy them using the **AWS SAM CLI**. Alternatively, consider using **Terraform** if it aligns better with your preferences and requirements.

## 13. Source Control - GitHub Repository

Maintain version control by creating a dedicated **GitHub repository** for your backend code. This practice ensures code collaboration and safety.

## 14. CI/CD (Back end) - Automate Deployments

Implement **GitHub Actions** for continuous integration and deployment (CI/CD). When you push updates to your SAM template or Python code, run Python tests, package the SAM application, and deploy it to AWS automatically.

## 15. CI/CD (Front end) - Keep Your Site Updated

Create a separate **GitHub repository** for your website code. Set up GitHub Actions so that when you push new website code, the S3 bucket is automatically updated. Remember to avoid committing AWS credentials to source control for security reasons.

## 16. Blog Post - Share Your Journey

Incorporate a link to a **blog post** within your resume, where you share insights and lessons learned throughout this project. Platforms like [Dev.to](https://dev.to/) and [Hashnode](https://hashnode.com/) are excellent for publishing if you don't have a personal blog.

That's the comprehensive breakdown of the Cloud Resume Challenge requirements and best practices. Embrace these guidelines to enhance your cloud skills, build an impressive resume, and advance your career in the world of cloud computing.


