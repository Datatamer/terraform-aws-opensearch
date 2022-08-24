resource "aws_vpc" "es_vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

resource "aws_subnet" "es_subnet" {
  vpc_id     = aws_vpc.es_vpc.id
  cidr_block = var.subnet_cidr
  tags       = var.tags
}

module "sg-ports" {
  #source = "git::https://github.com/Datatamer/terraform-aws-opensearch.git//modules/es-ports?ref=6.0.0"
  source = "../../modules/es-ports"
}

module "aws-sg" {
  source              = "git::git@github.com:Datatamer/terraform-aws-security-groups.git?ref=1.0.1"
  vpc_id              = aws_vpc.es_vpc.id
  ingress_cidr_blocks = var.ingress_cidr_blocks
  egress_cidr_blocks = [
    "0.0.0.0/0"
  ]
  ingress_ports    = module.sg-ports.ingress_ports
  sg_name_prefix   = var.name-prefix
  ingress_protocol = "tcp"
  egress_protocol  = "all"
  tags             = var.tags
}

resource "aws_iam_service_linked_role" "es" {
  count            = var.create_new_service_role == true ? 1 : 0
  aws_service_name = "es.amazonaws.com"
}

module "tamr-es-cluster" {
  depends_on = [
    aws_iam_service_linked_role.es,
    aws_cloudwatch_log_group.es-logs
  ]
  source             = "../../"
  domain_name        = format("%s-opensearch", var.name-prefix)
  subnet_ids         = [aws_subnet.es_subnet.id]
  security_group_ids = module.aws-sg.security_group_ids
  log_types          = var.log_types
  log_group_name     = aws_cloudwatch_log_group.es-logs.name
  tags               = var.tags
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "es-logs" {
  name = format("%s-%s", var.name-prefix, "example-logs")
}
