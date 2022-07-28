variable "ports" {
  type        = list(number)
  description = "Ports used by the OpenSearch"
  default = [
    80,  // HTTP
    443, // HTTPS
  ]
}

variable "additional_ports" {
  type        = list(number)
  description = "Additional ports to add to the output of this module"
  default     = []
}
