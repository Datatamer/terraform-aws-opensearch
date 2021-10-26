module "tamr-es-cluster" {
  source                  = "../../examples/minimal"
  vpc_cidr                = var.vpc_cidr
  name-prefix             = var.name-prefix
  subnet_cidr             = var.subnet_cidr
  create_new_service_role = var.create_new_service_role
  ingress_cidr_blocks     = var.ingress_cidr_blocks
  tags                    = var.tags
}
