resource "aws_cloudwatch_log_group" "es-logs" {
  for_each = toset(var.log_types)

  name_prefix = format("%s-%s", var.domain_name, each.value)

  retention_in_days = var.log_retention_in_days
  tags = var.tags
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
  count = length(var.log_types) > 0 ? 1 : 0
  policy_document = data.aws_iam_policy_document.es-tamr-log-publishing-policy.json
  policy_name     = "es-tamr-log-publishing-policy-${random_string.suffix}"
}

resource "random_string" "suffix" {
  length           = 4
  special          = false
}
