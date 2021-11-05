locals {
  effective_tags = length(var.tags) > 0 ? var.tags : var.es_tags

  log_publishing_options = [
    for key, log_group in aws_cloudwatch_log_group.es-logs : {"log_group_arn" = log_group.arn, "log_type" = key}
  ]
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
  log_publishing_options          = local.log_publishing_options

  depends_on = [
    aws_cloudwatch_log_group.es-logs
  ]
}

resource "aws_cloudwatch_log_group" "es-logs" {
  for_each = toset(var.log_types)

  name_prefix = format("%s-%s", var.domain_name, each.value)

  retention_in_days = var.log_retention_in_days
  tags = local.effective_tags
}

data "aws_iam_policy_document" "es-tamr-log-publishing-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
    ]

    resources = [ for i in aws_cloudwatch_log_group.es-logs : i.arn ]

    principals {
      identifiers = ["es.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "es-tamr-log-publishing-policy" {
  policy_document = data.aws_iam_policy_document.es-tamr-log-publishing-policy.json
  policy_name     = "es-tamr-log-publishing-policy"
}
