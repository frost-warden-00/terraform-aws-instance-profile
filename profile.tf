## Gitlab

data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = var.statement
    content {
      sid       = lookup(statement.value, "sid", null)
      effect    = lookup(statement.value, "effect", null)
      actions   = lookup(statement.value, "actions", null)
      resources = lookup(statement.value, "resources", null)
    }
  }
}

resource "aws_iam_policy" "profile_policy" {
  name   = var.profile_policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.this.json

  tags = merge(tomap({ "Name" = var.profile_policy_name }))
}

resource "aws_iam_role" "profile_role" {

  name = var.profile_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement : [
      {
        "Sid" : "InstanceProfile",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = merge(tomap({ "Name" = var.profile_role_name }))
}

resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.profile_role.name
  policy_arn = aws_iam_policy.profile_policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {

  name = var.instance_profile_name
  role = aws_iam_role.profile_role.name

  tags = merge(tomap({ "Name" = var.instance_profile_name }))
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.instance_profile.name
}