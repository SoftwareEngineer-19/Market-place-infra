
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.33.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
  backend "remote" {
		hostname = "app.terraform.io"
		organization = "AWS-Architet-org"

		workspaces {
			name = "Marketplace-QA"
		}
	}
}

provider "aws" {
	region = "us-east-1"

}
