<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| log\_group\_name | The name of an existent CloudWatch Log Group that ElasticSearch will publish logs to | `string` | `""` | no |
| log\_types | A list of log types that will be published to CloudWatch. Valid values are SEARCH\_SLOW\_LOGS, INDEX\_SLOW\_LOGS, ES\_APPLICATION\_LOGS and AUDIT\_LOGS. | `list(string)` | <pre>[<br>  "ES_APPLICATION_LOGS",<br>  "SEARCH_SLOW_LOGS",<br>  "INDEX_SLOW_LOGS"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_publishing\_options | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# License
Apache 2 Licensed. See LICENSE for full details.
