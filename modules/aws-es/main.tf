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

  tags = var.additional_tags

  depends_on = [
    var.linked_service_role,
  ]
}

resource "aws_iam_service_linked_role" "es" {
  count            = var.create_new_service_role == true ? 1 : 0
  aws_service_name = "es.amazonaws.com"
}

data "aws_iam_policy_document" "es-access-policy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "es:*"
    ]
    resources = [
      "arn:aws:es:${var.aws_region}:${var.aws_account_id}:domain/${var.domain_name}/*"
    ]

    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}
