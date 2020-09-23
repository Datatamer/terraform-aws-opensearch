# Tamr AWS ES Security Group Terraform Module
This terraform module creates a security group for ES on AWS.
This repo follows the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "tamr-es-cluster" {
  source = "git::https://github.com/Datatamer/terraform-aws-es//modules/es-security-group?ref=0.2.0"
  vpc_id = "vpc-id"
}
```

# Resources Created
This modules creates:
* a new Elasticsearch domain in AWS
* optionally, a new IAM service linked role for ES

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.45.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.45.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_id | The ID of the VPC in which to attach the security group | `string` | n/a | yes |
| additional\_tags | Additional tags to be attached to the resources created | `map(string)` | `{}` | no |
| enable\_http | If set to true, enables SSH | `bool` | `true` | no |
| enable\_https | If set to true, enables SSH | `bool` | `true` | no |
| ingress\_cidr\_blocks | CIDR blocks to attach to security groups for ingress | `list(string)` | `[]` | no |
| ingress\_security\_groups | Existing security groups to attch to new security groups for ingress | `list(string)` | `[]` | no |
| revoke\_rules\_on\_delete | Whether to revoke rules from the SG upon deletion | `bool` | `true` | no |
| sg\_name | Security Group to create | `string` | `"es-security-group"` | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_security\_group\_id | ID of the security group created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# License
Apache 2 Licensed. See LICENSE for full details.
