output "log_publishing_options" {
  value = (var.log_group_name == "" ? [] : 
            [for type in var.log_types : { "log_group_arn" = one(data.aws_cloudwatch_log_group.es-logs[*].arn),
                                           "log_type" = type }]
  )
}
