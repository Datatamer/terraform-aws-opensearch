# Tamr AWS Elasticsearch Terraform Module
This terraform module creates an OpenSearch domain on AWS.

**Prerequisite**

This module requires an [IAM service linked role](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html) for OpenSearch on the AWS account.

To create an OpenSearch service role in terraform:
```
resource "aws_iam_service_linked_role" "opensearch-service-role" {
  aws_service_name = "opensearchservice.amazonaws.com"
}
```

OpenSearch Service automatically creates a new OpenSearch service-linked role the first time you create an OpenSearch domain if you have permissions for the iam:CreateServiceLinkedRole action and the legacy Elasticsearch role doesn't exist in your account.

There can be only one service linked role for per AWS account.

You may run into an error like this when trying to remove the ES service linked role if there is still an OpenSearch domain in the account:
```
Error: Error waiting for role (arn:aws:iam::000000000000:role/aws-service-role/es.amazonaws.com/AWSServiceRoleForAmazonElasticsearchService) to be deleted: unexpected state 'FAILED', wanted target 'SUCCEEDED'.
```

You will need to ensure all the domains are completely removed before attempting to remove the service linked service role. If it appears like all the domains have already been removed, you can try again.

# Examples
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-aws-opensearch/tree/master/examples/minimal)

# Resources Created
This module creates:
* a new OpenSearch domain in AWS

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.36.0, < 4.0.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| subnet\_ids | List of subnet IDs for the OpenSearch domain to be created in | `list(string)` | n/a | yes |
| vpc\_id | The ID of the VPC in which to attach the security group | `string` | n/a | yes |
| arn\_partition | The partition in which the resource is located. A partition is a group of AWS Regions.<br>  Each AWS account is scoped to one partition.<br>  The following are the supported partitions:<br>    aws -AWS Regions<br>    aws-cn - China Regions<br>    aws-us-gov - AWS GovCloud (US) Regions | `string` | `"aws"` | no |
| aws\_region | AWS region to launch in | `string` | `"us-east-1"` | no |
| domain\_name | The name to give to the OpenSearch domain | `string` | `"tamr-es-cluster"` | no |
| ebs\_enabled | Whether EBS volumes are attached to data nodes | `bool` | `true` | no |
| ebs\_iops | The baseline I/O performance of EBS volumes attached to nodes.<br>  Iops is only valid when volume type is io1 | `number` | `null` | no |
| ebs\_volume\_size | The size of EBS volumes attached to data nodes (in GB) | `number` | `100` | no |
| ebs\_volume\_type | The type of EBS volumes attached to data nodes | `string` | `"gp2"` | no |
| enable\_http | If set to true, enables SSH | `bool` | `true` | no |
| enable\_https | If set to true, enables SSH | `bool` | `true` | no |
| enforce\_https | Whether or not to require HTTPS on the domain endpoint | `bool` | `true` | no |
| es\_tags | [DEPRECATED: Use `tags` instead] Additional tags to be attached to the OpenSearch domain and associated resources. | `map(string)` | `{}` | no |
| es\_version | Version of OpenSearch to deploy | `string` | `"6.8"` | no |
| ingress\_cidr\_blocks | CIDR blocks to attach to security groups for ingress | `list(string)` | `[]` | no |
| ingress\_security\_groups | Existing security groups to attch to new security groups for ingress | `list(string)` | `[]` | no |
| instance\_count | Number of instances to launch in the OpenSearch domain | `number` | `2` | no |
| instance\_type | Instance type of data nodes in the domain | `string` | `"c5.large.elasticsearch"` | no |
| kms\_key\_id | The KMS key id to encrypt the Elasticsearch domain with.<br>  If not specified then it defaults to using the aws/es service KMS key | `string` | `null` | no |
| log\_group\_name | The name of an existent CloudWatch Log Group that ElasticSearch will publish logs to | `string` | `""` | no |
| log\_types | A list of log types that will be published to CloudWatch. Valid values are SEARCH\_SLOW\_LOGS, INDEX\_SLOW\_LOGS, ES\_APPLICATION\_LOGS and AUDIT\_LOGS. | `list(string)` | <pre>[<br>  "ES_APPLICATION_LOGS",<br>  "SEARCH_SLOW_LOGS",<br>  "INDEX_SLOW_LOGS"<br>]</pre> | no |
| node\_to\_node\_encryption\_enabled | Whether to enable node-to-node encryption | `bool` | `true` | no |
| revoke\_rules\_on\_delete | Whether to revoke rules from the SG upon deletion | `bool` | `true` | no |
| security\_group\_ids | List of security group IDs to be applied to the OpenSearch domain | `list(string)` | `[]` | no |
| sg\_name | Security Group to create | `string` | `"es-security-group"` | no |
| sg\_tags | Additional tags to be attached to the security group | `map(string)` | `{}` | no |
| snapshot\_start\_hour | Hour when an automated daily snapshot of the indices is taken | `number` | `0` | no |
| tags | A map of tags to add to all resources. Replaces `es_tags`. | `map(string)` | `{}` | no |
| tls\_security\_policy | The name of the TLS security policy that needs to be applied to the HTTPS endpoint.<br>  Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07. | `string` | `"Policy-Min-TLS-1-2-2019-07"` | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_security\_group\_ids | List of security group IDs of the security groups used by ES |
| tamr\_es\_domain\_endpoint | Endpoint of ES domain created |
| tamr\_es\_domain\_id | ID of the ES domain created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# Development
## Generating Docs
Run `make terraform/docs` to generate the section of docs around terraform inputs, outputs and requirements.

## Checkstyles
Run `make lint`, this will run terraform fmt, in addition to a few other checks to detect whitespace issues.
NOTE: this requires having docker working on the machine running the test

## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
