##################################################
# Terraform
##################################################
terraform {
  required_version = ">= 0.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

##################################################
# Provider
##################################################
provider "aws" {
  region = var.demo-region
}

##################################################
# Resource - VPC -
##################################################
resource "aws_vpc" "demo-vpc" {
  cidr_block           = "10.10.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.environment}-vpc"
    Env  = local.environment
  }
}
