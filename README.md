<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.64.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.64.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.account-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.user-account-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_kms_key.new_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [random_pet.env](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_iam_context"></a> [aws\_iam\_context](#input\_aws\_iam\_context) | Configuration variables used for the AWS IAM resources | <pre>object({<br>    aws_iam_user             = optional(string)<br>    aws_iam_user_path        = optional(string)<br>    aws_iam_user_tags        = optional(map(any))<br>    aws_iam_user_policy_name = optional(string)<br><br>    aws_iam_user_policy = optional(object({<br>      Version = optional(string, "2012-10-17")<br>      Statement = list(object({<br>        Effect   = optional(string)<br>        Action   = optional(list(string))<br>        Resource = optional(string)<br>      }))<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_aws_kms_context"></a> [aws\_kms\_context](#input\_aws\_kms\_context) | Configuration variables used for the AWS KMS resources | <pre>object({<br>    aws_kms_key_create = optional(bool)<br>    aws_kms_key_config = optional(object({<br>      description = optional(string)<br>      rotation    = optional(bool)<br>      deletion    = optional(number)<br>    }))<br>    aws_kms_key_policy = optional(object({<br>      Id = optional(string)<br>      Statement = optional(list(object({<br>        Action    = optional(string)<br>        Effect    = optional(string)<br>        Principal = optional(map(any))<br>        Resource  = optional(string)<br>        Sid       = optional(string)<br>      })))<br>      Version = optional(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_provider_aws"></a> [provider\_aws](#input\_provider\_aws) | Configuration passed to the Hashicorp/aws provider | <pre>object({<br>    region = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms"></a> [kms](#output\_kms) | Map containing KMS outputs for use in other modules |
| <a name="output_user"></a> [user](#output\_user) | Map containing IAM user outputs for use in other modules |
<!-- END_TF_DOCS -->