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
  default     = []
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
  default     = 0
  type        = number
  description = "The baseline I/O performance of EBS volumes attached to nodes"
}

variable "ebs_volume_size" {
  default     = 10
  type        = number
  description = "The size of EBS volumes attached to data nodes (in GB)"
}

variable "ebs_volume_type" {
  default     = "gp2"
  type        = string
  description = "The type of EBS volumes attached to data nodes"
}

variable "additional_tags" {
  default     = { Author : "Tamr" }
  type        = map(string)
  description = "Additional tags to be attached to the ES domain"
}

variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "AWS region to launch in"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account ID to use"
}

variable "create_new_service_role" {
  default     = true
  type        = bool
  description = "Whether to create a new IAM service linked role for ES. This only needs to happen once per account"
}
