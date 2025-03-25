variable "enable_rds_oracle_sg_rule" {
  type        = bool
  description = "Enable creation of RDS Oracle security group ingress rule"
  default     = true
}

variable "enable_couchbase_sg_rule" {
  type        = bool
  description = "Enable creation of Couchbase security group ingress rule"
  default     = true
}

variable "ingress_cidr_blocks" {
  type        = set(string)
  description = "Set of CIDR blocks for the ingress rule"
  default = [
    # In practice, this is rarely used.
    "192.168.1.1/32",
    "192.168.1.2/32",
    "192.168.1.3/32"
  ]
}

