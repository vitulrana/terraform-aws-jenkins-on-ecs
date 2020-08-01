# Un-comment this if you want to use S3-Bucket for Saving Terraform State
# Make sure this Bucket is Pre-created for this case
# terraform {
#   backend "s3" {
#     bucket = "terraform-state-aws-s3-bucket"
#     key = "jenkins/terraform.tfstate"
#     region = "ap-south-1"
#   }
# }

provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}