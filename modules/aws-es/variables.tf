variable "domain_name" {
  default     = "tamr-es-cluster"
  type        = string
  description = "The name to give to the OpenSearch domain"
}

variable "es_version" {
  default     = "6.8"
  type        = string
  description = "Version of OpenSearch to deploy"
}

variable "instance_count" {
  default     = 2
  type        = number
  description = "Number of instances to launch in the OpenSearch domain"
}

variable "instance_type" {
  default     = "c5.large.elasticsearch"
  type        = string
  description = "Instance type of data nodes in the domain"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the OpenSearch domain to be created in"
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

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A map of tags to add to all resources."
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to launch in"
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

variable "log_publishing_options" {
  type = list(object({
    log_group_arn = string
    log_type      = string
  }))
  description = "Set of objects containing values for publishing logs to cloudwatch"
  default     = []
}
