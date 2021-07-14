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

