# Tamr AWS ES Ports Module
This module returns a list of ports used by the OpenSearch Service on AWS.

# Examples
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "tamr-opensearch-ports" {
  source = "git::https://github.com/Datatamer/terraform-aws-opensearch//modules/es-ports?ref=3.0.0"
}
```

# Resources Created
This modules creates no resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_ports | Additional ports to add to the output of this module | `list(number)` | `[]` | no |
| ports | Ports used by the Elasticsearch | `list(number)` | <pre>[<br>  80,<br>  443<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| ingress\_ports | List of ingress ports |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# License
Apache 2 Licensed. See LICENSE for full details.
