output "tamr_es_domain_id" {
  value       = module.tamr-es-cluster.tamr_es_domain_id
  description = "ID of the OpenSearch domain created"
}

output "tamr_es_domain_endpoint" {
  value       = module.tamr-es-cluster.tamr_es_domain_endpoint
  description = "Endpoint of OpenSearch domain created"
}
