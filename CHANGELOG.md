# Tamr Terraform AWS Elasticsearch Repo

## v3.0.0 - August 9th 2021
* Requires ES service role to be created as a prerequisite to using this module (see README)
* Removes input variables `linked_service_role` and `create_new_service_role`
* Example updated on how to create the ES service role

## v2.1.0 - July 12nd 2021
* Adds new variable `tags` to set tags for all resources
* Deprecates `es_tags` in favor of `tags`

## v2.0.0 - October 13th 2020
* New input variables for the main module:
    * `security_group_ids`
* Removed input variables from the main module:
  * `ingress_cidr_blocks`
  * `ingress_security_groups`
  * `egress_cidr_blocks`
  * `egress_security_groups`
  * `ports`
  * `security_group_tags`
  * `sg_name`
* Outputs changed in main module
  * `es_security_group_id` -> `es_security_group_ids`
* Removes the security groups module
* Adds a new ports module
* Updates example with security group creation and new variable `name-prefix`

## v1.0.1 - April 13th 2021
* Fixes a deprecation warning about interpolation-only expressions

## v1.0.0 - April 12th 2021
* Updates minimum Terraform version to 13
* Updates minimum AWS provider version to 3.36.0

## v0.3.0 - April 7th 2021
*  Adds new variable `arn_partition` to set the partition of any ARNs referenced in this module

## v0.2.1 - October 13th 2020
* Adds output `tamr_es_domain_endpoint`

## v0.2.0 - September 18th 2020
* Adds new configuration for setting in-transit and at-rest encryption options
* Removes unnecessary configuration value aws_account_id
* Unsets default for ebs_iops since it isn't compatible with the default disk type gp2
* Makes subnet_ids required
* Applies consistent formatting
* Updates the minimal example

## v0.1.0 - June 26th 2020
* Initing project
