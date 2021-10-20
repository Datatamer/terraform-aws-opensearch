output "tamr_es_domain_id" {
  value       = var.instance_count > 0 ? module.tamr-es-cluster[0].tamr_es_domain_id : null
  description = "ID of the ES domain created"
}

output "tamr_es_domain_endpoint" {
  value       = var.instance_count > 0 ? module.tamr-es-cluster[0].tamr_es_domain_endpoint : null
  description = "Endpoint of ES domain created"
}

output "es_security_group_ids" {
  value       = var.security_group_ids
  description = "List of security group IDs of the security groups used by ES"
}
