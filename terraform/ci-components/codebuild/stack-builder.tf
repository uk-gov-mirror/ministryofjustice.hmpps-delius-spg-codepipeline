resource "aws_codebuild_project" "spg-stack-builder" {
  name           = local.stack_builder_name
  description    = "Version 12 terraform builder container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.stack_builder_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.stack_builder_file
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.terraform_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    privileged_mode             = true
  }

  vpc_config {
    vpc_id             = local.vpc_id
    subnets            = local.private_subnet_ids
    security_group_ids = local.security_groups_ids
  }
}