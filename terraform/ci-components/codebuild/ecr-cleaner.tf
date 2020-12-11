resource "aws_codebuild_project" "spg-ecr-cleaner" {
  name           = local.ecr_cleaner_name
  description    = "Docker smoke tests runner container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.ecr_cleaner_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.ecr_cleaner_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.aws_codebuild_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }
}