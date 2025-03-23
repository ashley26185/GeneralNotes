terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.0"
   }
 }
}

provider "aws" {
 region = "us-east-1"
}

data "aws_vpc" "default" {
 default = true
}

variable "ingress_cidr_blocks" {
  type = list(string)
  default = [
    # In practice, this is rarely used.
    "192.168.1.1/32",
    "192.168.1.2/32",
    "192.168.1.3/32"
  ]
}

 # AWS Security Group Ingress Rules
 ## Define the security group
resource "aws_security_group" "observability_sg" {
  name        = "observability-sg-tf"
  description = "This security group contains the necessary rules for observability"
  vpc_id      = data.aws_vpc.default.id
  tags = {
    Name = "observability_sg"
  }
}

## Define the security group rules
### Couchbase Security Group Rule
resource "aws_vpc_security_group_ingress_rule" "observability_sgrule_couchbase" {
  for_each          = toset(var.ingress_cidr_blocks)
  cidr_ipv4         = each.value
  from_port         = 8091
  to_port           = 8091
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.observability_sg.id
}

