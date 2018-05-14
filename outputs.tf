output "role_arn" {
  description = "The IAM role ARN"
  value = "${join(",",aws_iam_role.role.*.arn)}"
}

output "policy_arn" {
  description = "The IAM policy ARN"
  value = "${join(",",aws_iam_policy.policy.*.arn)}"
}

output "role_name" {
  description = "The IAM role ARN"
  value = "${join(",",aws_iam_role.role.*.name)}"
}

