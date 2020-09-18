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

variable "additional_tags" {
  default     = {}
  type        = map(string)
  description = "Additional tags to be attached to the ES domain"
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to launch in"
}

variable "linked_service_role" {
  type        = string
  description = "Name of the IAM linked service role that enables ES. This value must take the form of aws_iam_service_linked_role.<name>"
  default     = "aws_iam_service_linked_role.es"
}

variable "create_new_service_role" {
  default     = "true"
  type        = bool
  description = "Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked_service_role is required"
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
