output "es_security_group_id" {
  value = aws_security_group.elasticsearch-sg.id
  description = "ID of the security group created"
}
