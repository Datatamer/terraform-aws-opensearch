output "tamr_es_domain_id" {
  value       = module.tamr-es-cluster.tamr_es_domain_id
  description = "ID of the security group created"
}

output "es_security_group_id" {
  value       = module.elasticsearch-sg.es_security_group_id
  description = "ID of the security group created"
}
