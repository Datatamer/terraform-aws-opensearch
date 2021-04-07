# AWS ES Module
This is a terraform module for a new ES domain on AWS.
This repo is laid out following the [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure).

# Examples
An inline example implementation of the module is implemented in the examples folder.
This is the most basic example of what it would look like to use this module.

```
module "tamr-es-cluster" {
  source     = "git::https://github.com/Datatamer/terraform-aws-es//modules/aws-es?ref=0.2.0"
  subnet_ids = ["subnet-id"]
}
```

# Resources Created
This modules creates:
* a new security group with one or two attached rules (HTTP and/or HTTPS enabled)

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
| subnet\_ids | List of subnet IDs for the ES domain to be created in | `list(string)` | n/a | yes |
| additional\_tags | Additional tags to be attached to the ES domain | `map(string)` | `{}` | no |
| arn\_partition | The partition in which the resource is located. A partition is a group of AWS Regions.<br>  Each AWS account is scoped to one partition.<br>  The following are the supported partitions:<br>    aws -AWS Regions<br>    aws-cn - China Regions<br>    aws-us-gov - AWS GovCloud (US) Regions | `string` | `"aws"` | no |
| aws\_region | AWS region to launch in | `string` | `"us-east-1"` | no |
| create\_new\_service\_role | Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked\_service\_role is required | `bool` | `"true"` | no |
| domain\_name | The name to give to the ES domain | `string` | `"tamr-es-cluster"` | no |
| ebs\_enabled | Whether EBS volumes are attached to data nodes | `bool` | `true` | no |
| ebs\_iops | The baseline I/O performance of EBS volumes attached to nodes.<br>  Iops is only valid when volume type is io1 | `number` | `null` | no |
| ebs\_volume\_size | The size of EBS volumes attached to data nodes (in GB) | `number` | `100` | no |
| ebs\_volume\_type | The type of EBS volumes attached to data nodes | `string` | `"gp2"` | no |
| enforce\_https | Whether or not to require HTTPS on the domain endpoint | `bool` | `true` | no |
| es\_version | Version of ES to deploy | `string` | `"6.8"` | no |
| instance\_count | Number of instances to launch in the ES domain | `number` | `2` | no |
| instance\_type | Instance type of data nodes in the domain | `string` | `"c5.large.elasticsearch"` | no |
| kms\_key\_id | The KMS key id to encrypt the Elasticsearch domain with.<br>  If not specified then it defaults to using the aws/es service KMS key | `string` | `null` | no |
| linked\_service\_role | Name of the IAM linked service role that enables ES. This value must take the form of aws\_iam\_service\_linked\_role.<name> | `string` | `"aws_iam_service_linked_role.es"` | no |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | `bool` | `true` | no |
| security\_group\_ids | List of security group IDs to be applied to the ES domain | `list(string)` | `[]` | no |
| snapshot\_start\_hour | Hour when an automated daily snapshot of the indices is taken | `number` | `0` | no |
| tls\_security\_policy | The name of the TLS security policy that needs to be applied to the HTTPS endpoint.<br>  Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07. | `string` | `"Policy-Min-TLS-1-2-2019-07"` | no |

## Outputs

| Name | Description |
|------|-------------|
| tamr\_es\_domain\_endpoint | Endpoint of ES domain created |
| tamr\_es\_domain\_id | ID of the ES domain created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# License
Apache 2 Licensed. See LICENSE for full details.
