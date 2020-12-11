resource "aws_codebuild_project" "spg-application-deployer" {
  name           = local.application_deployer_name
  description    = "Docker application deployer container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.application_deployer_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.application_deployer_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.aws_ecs_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }
}