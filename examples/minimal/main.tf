resource "aws_vpc" "es_vpc" {
  cidr_block = "1.2.3.0/24"
}

resource "aws_subnet" "es_subnet" {
  vpc_id     = aws_vpc.es_vpc.id
  cidr_block = "1.2.3.0/24"
}

module "tamr-es-cluster" {
  source      = "../../"
  vpc_id      = aws_vpc.es_vpc.id
  domain_name = "minimal-example-es-cluster"
  subnet_ids  = [aws_subnet.es_subnet.id]
  # Only needed once per account, so may need to set this to false
  create_new_service_role = true
}
