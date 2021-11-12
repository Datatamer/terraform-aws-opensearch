resource "aws_elasticsearch_domain" "tamr-es-cluster" {
  domain_name           = var.domain_name
  elasticsearch_version = var.es_version

  cluster_config {
    instance_count = var.instance_count
    instance_type  = var.instance_type
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  access_policies = data.aws_iam_policy_document.es-access-policy.json

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_start_hour
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    iops        = var.ebs_iops
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = var.kms_key_id
  }

  domain_endpoint_options {
    enforce_https       = var.enforce_https
    tls_security_policy = var.tls_security_policy
  }
  node_to_node_encryption {
    enabled = var.node_to_node_encryption_enabled
  }

  dynamic "log_publishing_options" {
    for_each = var.log_publishing_options
    content {
      cloudwatch_log_group_arn = log_publishing_options.value["log_group_arn"]
      enabled                  = true
      log_type                 = log_publishing_options.value["log_type"]
    }
  }

  tags = var.tags
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "es-access-policy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "es:*"
    ]
    resources = [
      "arn:${var.arn_partition}:es:${var.aws_region}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}
