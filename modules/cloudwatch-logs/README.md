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
| domain\_name | The name to give to the ES domain | `string` | `"tamr-es-cluster"` | no |
| log\_group\_name | The name of an existent CloudWatch Log Group that ElasticSearch will publish logs to | `string` | `""` | no |
| log\_retention\_in\_days | Specifies the number of days you want to retain log events.<br>  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0.<br>  If you select 0, the events in the log group are always retained and never expire. | `number` | `0` | no |
| log\_types | A list of log types that will be published to CloudWatch. Valid values are SEARCH\_SLOW\_LOGS, INDEX\_SLOW\_LOGS, ES\_APPLICATION\_LOGS and AUDIT\_LOGS. | `list(string)` | <pre>[<br>  "ES_APPLICATION_LOGS",<br>  "SEARCH_SLOW_LOGS",<br>  "INDEX_SLOW_LOGS"<br>]</pre> | no |
| tags | A map of tags to add to CloudWatch resources. | `map(string)` | `{}` | no |

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
