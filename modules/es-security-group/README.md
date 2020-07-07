# AWS ES Security Group Module
This is a terraform module for a security groups for ES on AWS.
This repo is laid out following the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
An inline example implementation of the module is implemented in the examples folder.
This is the most basic example of what it would look like to use this module.

```
module "tamr-es-sg" {
  source = "git::https://github.com/Datatamer/terraform-aws-es?ref=0.1.0"
  aws_account_id = "123456789"
}
```

# Resources Created
This modules creates:
* a new Elasticsearch domain in AWS
* optionally, a new IAM service linked role for ES on the AWS account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

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
