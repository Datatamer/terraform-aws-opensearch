#tfsec:ignore:aws-cloudwatch-log-group-customer-key
data "aws_cloudwatch_log_group" "es-logs" {
  count = var.log_group_name != "" ? 1 : 0
  name  = var.log_group_name
}

data "aws_iam_policy_document" "es-tamr-log-publishing-policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
    ]

    resources = (one(data.aws_cloudwatch_log_group.es-logs[*].arn) == null ?
      [] :
    [one(data.aws_cloudwatch_log_group.es-logs[*].arn)])

    principals {
      identifiers = ["es.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "es-tamr-log-publishing-policy" {
  count           = length(var.log_types) > 0 && var.log_group_name != "" ? 1 : 0
  policy_document = data.aws_iam_policy_document.es-tamr-log-publishing-policy.json
  policy_name     = "es-tamr-log-publishing-policy-${random_string.suffix.id}"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
}
