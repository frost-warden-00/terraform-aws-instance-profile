# IAM Instance Profile




## Getting started

Example

````HCL
module "instance_profile" {
  source = "/usr/modules/iam-instance-profile"
  profile_policy_name = "name-policy"
  profile_role_name = "name-role"
  instance_profile_name = "instance-profile"
  statement = [
    {
      sid = "parameter"
      effect = "Allow"
      actions = [
        "ssm:GetParameter",
        "ssm:GetParameters",
      ]
      resources = ["*"]
    },
    {
      sid = "s3bucket"
      effect = "Allow"
      actions = [
        "s3:GetEncryptionConfiguration",
        "s3:Get*",
        "s3:List*",
      ]
      resources = ["*"]
    }
  ]
}
````



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.profile_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.profile_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | Instance profile name | `string` | n/a | yes |
| <a name="input_profile_policy_name"></a> [profile\_policy\_name](#input\_profile\_policy\_name) | Profile policy name | `string` | n/a | yes |
| <a name="input_profile_role_name"></a> [profile\_role\_name](#input\_profile\_role\_name) | Role name | `string` | n/a | yes |
| <a name="input_statement"></a> [statement](#input\_statement) | Statement to use for IAM policy | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile_name"></a> [instance\_profile\_name](#output\_instance\_profile\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->