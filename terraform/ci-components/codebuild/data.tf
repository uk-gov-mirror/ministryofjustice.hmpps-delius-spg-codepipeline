data "template_file" "codebuild_assumerole_template" {
  template = file("./templates/iam/codebuild_assumerole_policy.tpl")
  vars     = {}
}

data "template_file" "codebuild_execution_policy_template" {
  template = file("./templates/iam/codebuild_execution_policy.tpl")

  vars = {}
}

