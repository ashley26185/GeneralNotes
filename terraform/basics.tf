# Basic Structure of main.tf in terraform

## Specify the providers you need
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

## Configure the provider
provider "aws" {
  region = "us-east-1"
}

## Configure the resource with options
resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}

# Using variables
variable "cheese" {
  type = string
  default = "Jack"
}

module "my_taco" {
  source = "./tacos"
  cheese = var.cheese
}

