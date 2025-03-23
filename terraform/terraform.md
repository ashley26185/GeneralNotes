# Instructions
Install terraform using brew / alternates
Install aws cli
Create a user and role with necessary permissions
aws configure with access key and secret key
Create the basic terraform project

## Resources
Resource names must start with a letter or underscore, and may contain only letters, digits, underscores, and dashes. 
terraform uses the name when referring to the resource in the same module, but it has no meaning outside that module's scope.

## data
data references an existing resource



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

