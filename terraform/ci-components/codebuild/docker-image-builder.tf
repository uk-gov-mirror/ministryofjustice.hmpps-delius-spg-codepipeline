resource "aws_codebuild_project" "spg-docker-image-builder" {
  name           = local.docker_image_builder_name
  description    = "Docker image builder container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.docker_image_builder_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.docker_image_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.aws_codebuild_image
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }
}