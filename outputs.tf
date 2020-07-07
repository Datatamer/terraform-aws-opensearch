output "tamr_es_domain_id" {
  value       = module.tamr-es-cluster.tamr_es_domain_id
  description = "ID of the security group created"
}

output "es_security_group_id" {
  value = aws_security_group.elasticsearch-sg.id
  description = "ID of the security group created"
}
