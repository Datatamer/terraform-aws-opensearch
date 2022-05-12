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
| ingress\_cidr\_blocks | n/a | `list(string)` | n/a | yes |
| name-prefix | A string to prepend to names of resources created by this example | `any` | n/a | yes |
| subnet\_cidr | n/a | `string` | n/a | yes |
| vpc\_cidr | n/a | `string` | n/a | yes |
| create\_new\_service\_role | Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked\_service\_role is required | `bool` | `false` | no |
| log\_retention\_in\_days | Specifies the number of days you want to retain log events.<br>  Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0.<br>  If you select 0, the events in the log group are always retained and never expire. | `number` | `0` | no |
| log\_types | A list of log types that will be published to CloudWatch. Valid values are SEARCH\_SLOW\_LOGS, INDEX\_SLOW\_LOGS, ES\_APPLICATION\_LOGS and AUDIT\_LOGS. | `list(string)` | <pre>[<br>  "ES_APPLICATION_LOGS",<br>  "SEARCH_SLOW_LOGS",<br>  "INDEX_SLOW_LOGS"<br>]</pre> | no |
| tags | A map of tags to add to all resources created by this example. | `map(string)` | <pre>{<br>  "Author": "Tamr",<br>  "Environment": "Example"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| es\_security\_group\_id | ID of the ES domain created |
| subnet\_id | n/a |
| tamr\_es\_domain\_endpoint | Endpoint of ES domain created |
| tamr\_es\_domain\_id | ID of the security group created |
| vpc\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
