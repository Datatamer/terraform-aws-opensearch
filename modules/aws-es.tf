resource "aws_elasticsearch_domain" "tamr-es-cluster" {
  domain_name           = var.domain_name
  elasticsearch_version = var.es_version

  cluster_config {
    instance_count = var.instance_count
    instance_type = var.instance_type
  }

  vpc_options {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  //to do: pull into data block
  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": "es:*",
          "Principal": "*",
          "Effect": "Allow",
          "Resource": "arn:aws:es:${var.aws_region}:${var.aws_account_id}:domain/${var.domain_name}/*"
      }
  ]
}
CONFIG

  //to do: make optional
  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_start_hour
  }

  //to do: make optional
  ebs_options {
    ebs_enabled = var.ebs_enabled
    iops        = var.ebs_iops
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  tags = var.additional_tags

  depends_on = [
    "aws_iam_service_linked_role.es",
  ]
}

resource "aws_iam_service_linked_role" "es" {
  aws_service_name = "es.amazonaws.com"
}
