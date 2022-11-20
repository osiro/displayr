terraform {
  required_version = ">= 1.3.5"


  # NOTE: Ideally, we want to keep the Terraform
  # state file securely stored remotely, e.g.: AWS S3 bucket or Terraform Cloud.

  # backend "s3" {
  #   bucket = "terraform-state-displayr"
  #   key    = "webserver/terraform.tfstate"
  #   region = "us-east-1"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
  }
}
