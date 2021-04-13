# Tamr Terraform AWS Elasticsearch Repo

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
