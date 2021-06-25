output "ingress_ports" {
  value = concat(
    var.ports,
    var.additional_ports,
  )
  description = "List of ingress ports"
}
