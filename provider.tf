provider "aws" {
  region = "us-east-2"
  profile = "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.45.1"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.13.2"
    }
  }

  required_version = ">= 1.7.0"
}