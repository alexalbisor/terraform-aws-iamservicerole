variable "toggle" {
  default = "on"
  description = "Whether to activate this module or not"
}

variable "service_role_name" {
  description = "The name you wish to assign the service iam role"
}
variable "aws_service_role_name" {
  type = "string"
  description = "The AWS Service role principal (without the amazonaws.com)"
}

variable "service_policy_name" {
  description = "The name you wish to assign the iam policy. will default to format(\"%s-policy\",var.service_role_name)"
  default = ""
}

variable "service_policy" {
  description = "The iam policy body"
}

variable "service_iam_path" {
  description = "The service role and policy iam path"
  default = "/"
}

variable "additional_policy_arns" {
  description = "Additional policiy ARNs that should be attached to the role"
  type        = "list"
  default     = []
}

