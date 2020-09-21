output "tamr_es_domain_id" {
  value       = module.tamr-es-cluster.tamr_es_domain_id
  description = "ID of the security group created"
}

output "es_security_group_id" {
  value       = module.tamr-es-cluster.es_security_group_id
  description = "ID of the security group created"
}

output "vpc_id" {
  value = aws_vpc.es_vpc.id
}

output "subnet_id" {
  value = aws_subnet.es_subnet.id
}
