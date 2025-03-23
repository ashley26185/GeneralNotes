# WARNING:
# You should not use the aws_vpc_security_group_egress_rule and aws_vpc_security_group_ingress_rule resources in conjunction with the aws_security_group resource with in-line rules (using the ingress and egress arguments of aws_security_group) or the aws_security_group_rule resource. Doing so may cause rule conflicts, perpetual differences, and result in rules being overwritten.

variable "allowed_cidr_blocks" {
  type = list(string)
  default = [
    # In practice, this is rarely used.
    "192.168.1.1/32",
    "192.168.1.2/32",
    "192.168.1.3/32"
  ]
}


# This is deprecated. Do Not Use. Use the egress and ingress rule insteamd
resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.alb.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.allowed_cidr_blocks
}
# ====================================

data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

# Security Group Egress Rules
resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

# AWS Security Group Ingress Rules
## Define the security group
resource "aws_security_group" "observability_sg" {
  name        = "observability_sg"
  description = "This security group contains the necessary rules for observability"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "observability_sg"
  }
}

## Define the ingress rules
### Couchbase Security Group Rule
resource "aws_vpc_security_group_ingress_rule" "observability_sgrule_couchbase" {
  security_group_id = aws_security_group.observability_sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 8091
  ip_protocol = "tcp"
  to_port     = 8091
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  for_each          = toset(var.ingress_cidr_blocks)
  from_port         = 0
  to_port           = 65535
  ip_protocol       = "tcp"
  cidr_ipv4         = each.value
  security_group_id = aws_security_group.allow_tcp_2.id
}

resource "aws_security_group" "allow_tcp" {
  name        = "allow_tcp"
  description = "Allow tcp traffic"
  vpc_id      = aws_vpc.main.id
}

