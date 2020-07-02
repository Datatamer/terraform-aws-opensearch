module "tamr-es-cluster" {
  source                  = "./modules/aws-es"
  domain_name             = var.domain_name
  es_version              = var.es_version
  instance_count          = var.instance_count
  instance_type           = var.instance_type
  subnet_ids              = var.subnet_ids
  security_group_ids      = var.security_group_ids
  snapshot_start_hour     = var.snapshot_start_hour
  ebs_enabled             = var.ebs_enabled
  ebs_iops                = var.ebs_iops
  ebs_volume_size         = var.ebs_volume_size
  ebs_volume_type         = var.ebs_volume_type
  additional_tags         = var.additional_tags
  aws_region              = var.aws_region
  aws_account_id          = var.aws_account_id
  create_new_service_role = var.create_new_service_role
}
