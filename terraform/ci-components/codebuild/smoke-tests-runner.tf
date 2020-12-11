resource "aws_codebuild_project" "spg-smoke-tests-runner" {
  name           = local.smoke_tests_runner_name
  description    = "Docker smoke tests runner container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.smoke_tests_runner_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.smoke_tests_runner_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.aws_codebuild_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  vpc_config {
    vpc_id             = local.vpc_id
    subnets            = local.private_subnet_ids
    security_group_ids = local.security_groups_ids
  }
}