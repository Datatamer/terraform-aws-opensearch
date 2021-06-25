output "tamr_es_domain_id" {
  value       = module.tamr-es-cluster.tamr_es_domain_id
  description = "ID of the ES domain created"
}

output "tamr_es_domain_endpoint" {
  value       = module.tamr-es-cluster.tamr_es_domain_endpoint
  description = "Endpoint of ES domain created"
}

output "es_security_group_ids" {
  value       = var.security_group_ids
  description = "List of security group IDs of the security groups used by ES"
}
