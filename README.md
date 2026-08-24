# Project 12 — Deploy a Web App to AWS Using Terraform

A practical Terraform example that provisions a small AWS web server using the default VPC, an existing public subnet, an EC2 instance, and a security group. The instance bootstraps Nginx and serves a simple web page.

## Architecture

`AWS Default VPC → Existing Subnet → Security Group → EC2 (Amazon Linux 2023) → Nginx`

The AMI is referenced through AWS Systems Manager's public Amazon Linux parameter so the configuration does not hard-code a regional AMI ID.

## Safety

This project **creates billable AWS resources when `terraform apply` is run**. Review `terraform plan` first and destroy the resources when finished. Restrict SSH (TCP/22) to your own IP before using this outside a lab.

No AWS credentials or Terraform state files belong in Git.

## Usage

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

GitHub Actions validates formatting, initialization, validation, and planning without deploying infrastructure.