# Terraform Module - IAM service role #

## Overview ##
Generic module to create IAM service roles.

Currently supported services:  

- lambda
- vpc-flow-logs

**NOTE**:  
  - New services will be added as the need arises  
  - To add new services, simply add new entries in the `service_mapping` map in the `variables.tf` file  

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_profile | The AWS profile to use | string | - | yes |
| aws_region | The AWS region | string | - | yes |
| service | The service to assume role to. For example: lambda, ec2 etc' | string | - | yes |
| service_iam_path | The service role and policy iam path | string | `/` | no |
| service_policy | The iam policy body | string | - | yes |
| service_policy_name | The name you wish to assign the iam policy | string | - | yes |
| service_role_name | The name you wish to assign the service iam role | string | - | yes |
| additional_policy_arns | Additional policiy ARNs that should be attached to the role | list | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | the IAM policy ARN |
| role_arn | the IAM role ARN |
| role_name | the IAM role name |

