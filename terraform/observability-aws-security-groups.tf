data "aws_vpc" "default" {
 default = true
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
  count = var.enable_couchbase_sg_rule? length(var.ingress_cidr_blocks) : 0

  description = "Pre-Req for Coucbase DB Monitoring"
  security_group_id = aws_security_group.observability_sg.id
  from_port         = 8091
  to_port           = 8091
  ip_protocol       = "tcp"
  cidr_ipv4         = var.enable_couchbase_sg_rule ? tolist(var.ingress_cidr_blocks)[count.index] : null
  tags = {
    Name = "Couchbase Monitoring"
  }

}

### RDS Oracle Security Group Rule
resource "aws_vpc_security_group_ingress_rule" "observability_sgrule_rds_oracle" {
  count = var.enable_rds_oracle_sg_rule ? length(var.ingress_cidr_blocks) : 0

  description = "Pre-Req to monitor RDS Oracle from Central LA"
  security_group_id = aws_security_group.observability_sg.id
  from_port         = 6515
  to_port           = 6520
  ip_protocol       = "tcp"
  cidr_ipv4         = var.enable_rds_oracle_sg_rule ? tolist(var.ingress_cidr_blocks)[count.index] : null

  tags = {
    Name = "RDS Oracle Monitoring"
  }
}
