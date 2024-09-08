variable "provider_aws" {}

variable "aws_kms_context" {
  type = object({
    aws_kms_key_create = optional(bool)
    aws_kms_key_config = optional(object({
      description = optional(string)
      rotation    = optional(bool)
      deletion    = optional(number)
    }))
    aws_kms_key_policy = optional(object({
      Id = optional(string)
      Statement = optional(list(object({
        Action    = optional(string)
        Effect    = optional(string)
        Principal = optional(map(any))
        Resource  = optional(string)
        Sid       = optional(string)
      })))
      Version = optional(string)
    }))
  })
}

variable "aws_iam_context" {
  type = object({
    aws_iam_user             = optional(string)
    aws_iam_user_path        = optional(string)
    aws_iam_user_tags        = optional(map(any))
    aws_iam_user_policy_name = optional(string)

    aws_iam_user_policy = optional(object({
      Version = optional(string, "2012-10-17")
      Statement = list(object({
        Effect   = optional(string)
        Action   = optional(list(string))
        Resource = optional(string)
      }))
    }))
  })
  default = null
}

