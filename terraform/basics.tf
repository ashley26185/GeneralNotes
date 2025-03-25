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

[for s in var.list : upper(s)]
[for i, v in var.list : "${i} is ${v}"]

[for k, v in var.map : length(k) + length(v)]


{for s in var.list : s => upper(s)}

## for with conditional if
[for s in var.list : upper(s) if s != ""]

variable "users" {
  type = map(object({
    is_admin = bool
  }))
}

locals {
  admin_users = {
    for name, user in var.users : name => user
    if user.is_admin
  }
  regular_users = {
    for name, user in var.users : name => user
    if !user.is_admin
  }
}


