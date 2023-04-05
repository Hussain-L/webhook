terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
  cloud {
    organization = "getting-started-hussain"

    workspaces {
      name = "webserver-nginx"
    }
  }
}
provider "aws" {
  region  = var.aws_region
}