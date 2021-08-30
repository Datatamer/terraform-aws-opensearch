locals {
  effective_tags = length(var.tags) > 0 ? var.tags : var.es_tags
}

module "tamr-es-cluster" {
  source                          = "./modules/aws-es"
  domain_name                     = var.domain_name
  es_version                      = var.es_version
  instance_count                  = var.instance_count
  instance_type                   = var.instance_type
  subnet_ids                      = var.subnet_ids
  security_group_ids              = var.security_group_ids
  snapshot_start_hour             = var.snapshot_start_hour
  ebs_enabled                     = var.ebs_enabled
  ebs_iops                        = var.ebs_iops
  ebs_volume_size                 = var.ebs_volume_size
  ebs_volume_type                 = var.ebs_volume_type
  tags                            = local.effective_tags
  aws_region                      = var.aws_region
  kms_key_id                      = var.kms_key_id
  enforce_https                   = var.enforce_https
  tls_security_policy             = var.tls_security_policy
  node_to_node_encryption_enabled = var.node_to_node_encryption_enabled
  arn_partition                   = var.arn_partition
}
