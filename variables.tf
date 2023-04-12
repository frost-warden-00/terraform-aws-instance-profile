variable "profile_policy_name" {
  description = "Profile policy name"
  type        = string
}

variable "profile_role_name" {
  description = "Role name"
  type        = string
}

variable "instance_profile_name" {
  description = "Instance profile name"
  type        = string
}

variable "statement" {
  description = "Statement to use for IAM policy"
  type        = any
}