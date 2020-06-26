module "aws-es" {
  source                        = "./modules/aws-es.tf"
  domain_name                   = var.domain_name
  elasticsearch_version         = var.version
  instance_count                = var.instance_count
  instance_type                 = var.instance_type
  subnet_ids                    = var.subnet_ids
  security_group_ids            = var.security_group_ids
  automated_snapshot_start_hour = var.snapshot_start_hour
  ebs_enabled                   = var.ebs_enabled
  iops                          = var.ebs_iops
  volume_size                   = var.ebs_volume_size
  volume_type                   = var.ebs_volume_type
  tags                          = var.additional_tags

}
