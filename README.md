# Tamr AWS Elasticsearch Terraform Module
This terraform module creates an Elasticsearch (ES) domain on AWS.

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "tamr-es-cluster" {
  source     = "git::https://github.com/Datatamer/terraform-aws-es?ref=0.2.0"
  vpc_id     = "vpc-id"
  subnet_ids = ["subnet-id"]
}
```
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-aws-es/tree/master/examples/minimal)

# Resources Created
This module creates:
* a new Elasticsearch domain in AWS
* optionally, a new IAM service linked role for ES on the AWS account
* a security group to attach to the ES domain, with HTTP and/or HTTPS enabled

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | >= 2.45.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| subnet\_ids | List of subnet IDs for the ES domain to be created in | `list(string)` | n/a | yes |
| vpc\_id | The ID of the VPC in which to attach the security group | `string` | n/a | yes |
| aws\_region | AWS region to launch in | `string` | `"us-east-1"` | no |
| create\_new\_service\_role | Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked\_service\_role is required | `bool` | `true` | no |
| domain\_name | The name to give to the ES domain | `string` | `"tamr-es-cluster"` | no |
| ebs\_enabled | Whether EBS volumes are attached to data nodes | `bool` | `true` | no |
| ebs\_iops | The baseline I/O performance of EBS volumes attached to nodes.<br>  Iops is only valid when volume type is io1 | `number` | `null` | no |
| ebs\_volume\_size | The size of EBS volumes attached to data nodes (in GB) | `number` | `100` | no |
| ebs\_volume\_type | The type of EBS volumes attached to data nodes | `string` | `"gp2"` | no |
| enable\_http | If set to true, enables SSH | `bool` | `true` | no |
| enable\_https | If set to true, enables SSH | `bool` | `true` | no |
| enforce\_https | Whether or not to require HTTPS on the domain endpoint | `bool` | `true` | no |
| es\_tags | Additional tags to be attached to the ES domain | `map(string)` | `{}` | no |
| es\_version | Version of ES to deploy | `string` | `"6.8"` | no |
| ingress\_cidr\_blocks | CIDR blocks to attach to security groups for ingress | `list(string)` | `[]` | no |
| ingress\_security\_groups | Existing security groups to attch to new security groups for ingress | `list(string)` | `[]` | no |
| instance\_count | Number of instances to launch in the ES domain | `number` | `2` | no |
| instance\_type | Instance type of data nodes in the domain | `string` | `"c5.large.elasticsearch"` | no |
| kms\_key\_id | The KMS key id to encrypt the Elasticsearch domain with.<br>  If not specified then it defaults to using the aws/es service KMS key | `string` | `null` | no |
| linked\_service\_role | Name of the IAM linked service role that enables ES. This value must take the form of aws\_iam\_service\_linked\_role.<name> and must be set if create\_new\_service\_role is false | `string` | `"aws_iam_service_linked_role.es"` | no |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | `bool` | `true` | no |
| revoke\_rules\_on\_delete | Whether to revoke rules from the SG upon deletion | `bool` | `true` | no |
| security\_group\_ids | List of security group IDs to be applied to the ES domain | `list(string)` | `[]` | no |
| sg\_name | Security Group to create | `string` | `"es-security-group"` | no |
| sg\_tags | Additional tags to be attached to the security group | `map(string)` | `{}` | no |
| snapshot\_start\_hour | Hour when an automated daily snapshot of the indices is taken | `number` | `0` | no |
| tls\_security\_policy | The name of the TLS security policy that needs to be applied to the HTTPS endpoint.<br>  Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07. | `string` | `"Policy-Min-TLS-1-2-2019-07"` | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_security\_group\_id | ID of the security group created |
| tamr\_es\_domain\_endpoint | Endpoint of ES domain created |
| tamr\_es\_domain\_id | ID of the ES domain created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# Development
## Generating Docs
Run `make gen` to generate the section of docs around terraform inputs, outputs and requirements.

## Checkstyles
Run `make lint`, this will run terraform fmt, in addition to a few other checks to detect whitespace issues.
NOTE: this requires having docker working on the machine running the test

## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
