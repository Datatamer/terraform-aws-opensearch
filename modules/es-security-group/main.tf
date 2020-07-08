resource "aws_security_group" "elasticsearch-sg" {
  name                   = var.sg_name
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete
  tags                   = var.additional_tags
}

// local variables to indicate whether to use CIDR blocks or security groups
locals {
  cidr_block_ingress_rule     = length(var.ingress_cidr_blocks) > 0 ? 1 : 0
  security_group_ingress_rule = length(var.ingress_security_groups) > 0 ? length(var.ingress_security_groups) : 0
}

resource "aws_security_group_rule" "https_access_cidr"{
  count             = var.enable_https && (local.cidr_block_ingress_rule > 0) ? 1 : 0
  description       = "HTTPS access from allowed CIDR blocks"
  security_group_id = aws_security_group.elasticsearch-sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidr_blocks
}

resource "aws_security_group_rule" "https_access_sg"{
  count                    = var.enable_https && (local.security_group_ingress_rule > 0) ? 1 : 0
  description              = "HTTPS access from allowed security groups"
  security_group_id        = aws_security_group.elasticsearch-sg.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = var.ingress_security_groups[count.index]
}

resource "aws_security_group_rule" "http_access_cidr"{
  count             = var.enable_http && (local.cidr_block_ingress_rule > 0) ? 1 : 0
  description       = "HTTP access from allowed CIDR blocks"
  security_group_id = aws_security_group.elasticsearch-sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidr_blocks
}

resource "aws_security_group_rule" "http_access_sg"{
  count                    = var.enable_http && (local.security_group_ingress_rule > 0) ? 1 : 0
  description              = "HTTP access from allowed security groups"
  security_group_id        = aws_security_group.elasticsearch-sg.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = var.ingress_security_groups[count.index]
}
