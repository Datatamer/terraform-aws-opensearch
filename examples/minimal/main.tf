module "tamr-es-cluster" {
  source         = "../../"
  aws_account_id = "123456789"
}

module "elasticsearch-sg" {
  source         = "../../"
  aws_account_id = "123456789"
  vpc_id         = "my-aws-vpc"
}
