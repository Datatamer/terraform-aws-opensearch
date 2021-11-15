variable "name-prefix" {
  description = "A string to prepend to names of resources created by this example"
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources created by this example."
  default = {
    Author      = "Tamr"
    Environment = "Example"
  }
}

variable "create_new_service_role" {
  default     = false
  type        = bool
  description = "Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked_service_role is required"
}
