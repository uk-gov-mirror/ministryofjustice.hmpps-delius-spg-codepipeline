resource "aws_iam_role" "codebuild_role" {
  name               = local.service_name
  assume_role_policy = data.template_file.codebuild_assumerole_template.rendered
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = local.service_name
  role = aws_iam_role.codebuild_role.name

  policy = data.template_file.codebuild_execution_policy_template.rendered
}
