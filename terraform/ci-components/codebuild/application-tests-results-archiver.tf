resource "aws_codebuild_project" "spg-application-tests-results-archiver" {
  name           = local.application_tests_results_archiver_name
  description    = "Docker application tests archiver container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.application_tests_results_archiver_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.application_tests_results_archiver_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.aws_cli_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }
}