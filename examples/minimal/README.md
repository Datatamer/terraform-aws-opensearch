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
| name-prefix | A string to prepend to names of resources created by this example | `any` | n/a | yes |
| create\_new\_service\_role | Whether to create a new IAM service linked role for ES. This only needs to happen once per account. If false, linked\_service\_role is required | `bool` | `false` | no |
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
