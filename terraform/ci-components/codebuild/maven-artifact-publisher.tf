resource "aws_codebuild_project" "spg-maven-artifact-deployer" {
  name           = local.maven_artifact_publisher_name
  description    = "Docker maven artifact deployer container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.maven_artifact_publisher_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.maven_artifact_publisher_file
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