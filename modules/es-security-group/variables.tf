variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which to attach the security group"
}

variable "sg_name" {
  type        = string
  description = "Security Group to create"
  default     = "es-security-group"
}

variable "revoke_rules_on_delete" {
  type        = bool
  description = "Whether to revoke rules from the SG upon deletion"
  default     = true
}

variable "enable_https" {
  type        = bool
  description = "If set to true, enables SSH"
  default     = true
}

variable "enable_http" {
  type        = bool
  description = "If set to true, enables SSH"
  default     = true
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks to attach to security groups for ingress"
  default     = []
}

variable "ingress_security_groups" {
  type        = list(string)
  description = "Existing security groups to attch to new security groups for ingress"
  default     = []
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags to be attached to the resources created"
  default     = {}
}
