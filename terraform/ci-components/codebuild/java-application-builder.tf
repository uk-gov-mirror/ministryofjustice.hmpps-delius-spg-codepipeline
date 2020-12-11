resource "aws_codebuild_project" "spg-java-application-builder" {
  name           = local.java_application_builder_name
  description    = "Java application builder container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.java_application_builder_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.java_application_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_LARGE"
    image           = var.aws_codebuild_image
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  vpc_config {
    vpc_id             = local.vpc_id
    subnets            = local.private_subnet_ids
    security_group_ids = local.security_groups_ids
  }
}