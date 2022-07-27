output "tamr_es_domain_id" {
  value       = aws_elasticsearch_domain.tamr-es-cluster.id
  description = "ID of the OpenSearch domain created"
}

output "tamr_es_domain_endpoint" {
  value       = aws_elasticsearch_domain.tamr-es-cluster.endpoint
  description = "Endpoint of OpenSearch domain created"
}
