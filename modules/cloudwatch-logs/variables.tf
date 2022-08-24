variable "log_types" {
  type        = list(string)
  description = "A list of log types that will be published to CloudWatch. Valid values are SEARCH_SLOW_LOGS, INDEX_SLOW_LOGS, ES_APPLICATION_LOGS and AUDIT_LOGS."
  default     = ["ES_APPLICATION_LOGS", "SEARCH_SLOW_LOGS", "INDEX_SLOW_LOGS"]
}

variable "log_group_name" {
  type        = string
  description = "The name of an existent CloudWatch Log Group that ElasticSearch will publish logs to"
  default     = ""
}
