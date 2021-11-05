output "log_publishing_options" {
    value = [for key, log_group in aws_cloudwatch_log_group.es-logs : {"log_group_arn" = log_group.arn, "log_type" = key}]
}
