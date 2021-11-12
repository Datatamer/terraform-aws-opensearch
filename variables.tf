variable "domain_name" {
  default     = "tamr-es-cluster"
  type        = string
  description = "The name to give to the ES domain"
}

variable "es_version" {
  default     = "6.8"
  type        = string
  description = "Version of ES to deploy"
}

variable "instance_count" {
  default     = 2
  type        = number
  description = "Number of instances to launch in the ES domain"
}

variable "instance_type" {
  default     = "c5.large.elasticsearch"
  type        = string
  description = "Instance type of data nodes in the domain"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the ES domain to be created in"
}

variable "security_group_ids" {
  default     = []
  type        = list(string)
  description = "List of security group IDs to be applied to the ES domain"
}

variable "snapshot_start_hour" {
  default     = 0
  type        = number
  description = "Hour when an automated daily snapshot of the indices is taken"
}

variable "ebs_enabled" {
  default     = true
  type        = bool
  description = "Whether EBS volumes are attached to data nodes"
}

variable "ebs_iops" {
  default     = null
  type        = number
  description = <<EOF
  The baseline I/O performance of EBS volumes attached to nodes.
  Iops is only valid when volume type is io1
  EOF
}

variable "ebs_volume_size" {
  default     = 100
  type        = number
  description = "The size of EBS volumes attached to data nodes (in GB)"
}

variable "ebs_volume_type" {
  default     = "gp2"
  type        = string
  description = "The type of EBS volumes attached to data nodes"
}

variable "es_tags" {
  type        = map(string)
  description = "[DEPRECATED: Use `tags` instead] Additional tags to be attached to the ES domain and associated resources."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources. Replaces `es_tags`."
  default     = {}
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to launch in"
}

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

variable "sg_tags" {
  type        = map(string)
  description = "Additional tags to be attached to the security group"
  default     = {}
}

variable "kms_key_id" {
  default     = null
  type        = string
  description = <<EOF
  The KMS key id to encrypt the Elasticsearch domain with.
  If not specified then it defaults to using the aws/es service KMS key
  EOF
}

variable "enforce_https" {
  default     = true
  type        = bool
  description = "Whether or not to require HTTPS on the domain endpoint"
}
variable "tls_security_policy" {
  default     = "Policy-Min-TLS-1-2-2019-07"
  type        = string
  description = <<EOF
  The name of the TLS security policy that needs to be applied to the HTTPS endpoint.
  Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07.
  EOF
}
variable "node_to_node_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable node-to-node encryption"
}

variable "arn_partition" {
  type        = string
  description = <<EOF
  The partition in which the resource is located. A partition is a group of AWS Regions.
  Each AWS account is scoped to one partition.
  The following are the supported partitions:
    aws -AWS Regions
    aws-cn - China Regions
    aws-us-gov - AWS GovCloud (US) Regions
  EOF
  default     = "aws"
}

variable "log_types" {
  type        = list(string)
  description = "A list of log types that will be published to CloudWatch. Valid values are SEARCH_SLOW_LOGS, INDEX_SLOW_LOGS, ES_APPLICATION_LOGS and AUDIT_LOGS."
  default     = ["ES_APPLICATION_LOGS", "SEARCH_SLOW_LOGS", "INDEX_SLOW_LOGS"]
}

variable "log_retention_in_days" {
  type        = number
  description = <<EOF
  Specifies the number of days you want to retain log events.
  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0.
  If you select 0, the events in the log group are always retained and never expire.
  EOF
  default     = 0
}
