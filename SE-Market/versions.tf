
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

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "marketplace-qa-remotestate"
    key            = "infrastructure/newqa/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf.backend"
  }
}
