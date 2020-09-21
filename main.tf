module "tamr-es-cluster" {
  source                          = "./modules/aws-es"
  domain_name                     = var.domain_name
  es_version                      = var.es_version
  instance_count                  = var.instance_count
  instance_type                   = var.instance_type
  subnet_ids                      = var.subnet_ids
  security_group_ids              = ["${module.elasticsearch-sg.es_security_group_id}"]
  snapshot_start_hour             = var.snapshot_start_hour
  ebs_enabled                     = var.ebs_enabled
  ebs_iops                        = var.ebs_iops
  ebs_volume_size                 = var.ebs_volume_size
  ebs_volume_type                 = var.ebs_volume_type
  additional_tags                 = var.es_tags
  aws_region                      = var.aws_region
  create_new_service_role         = var.create_new_service_role
  kms_key_id                      = var.kms_key_id
  enforce_https                   = var.enforce_https
  tls_security_policy             = var.tls_security_policy
  node_to_node_encryption_enabled = var.node_to_node_encryption_enabled
}

module "elasticsearch-sg" {
  source                  = "./modules/es-security-group"
  sg_name                 = var.sg_name
  vpc_id                  = var.vpc_id
  revoke_rules_on_delete  = var.revoke_rules_on_delete
  additional_tags         = var.sg_tags
  ingress_cidr_blocks     = var.ingress_cidr_blocks
  ingress_security_groups = var.ingress_security_groups
  enable_https            = var.enable_https
  enable_http             = var.enable_http
}
