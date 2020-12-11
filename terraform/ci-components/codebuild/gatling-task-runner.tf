resource "aws_codebuild_project" "spg-gatling-task-runner" {
  name           = local.gatling_task_runner_name
  description    = "Docker gatling task runner container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.gatling_task_runner_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.gatling_task_runner_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.gatling_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }
}