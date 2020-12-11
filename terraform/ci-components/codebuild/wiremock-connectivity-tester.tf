resource "aws_codebuild_project" "spg-wiremock-connectivity-tester" {
  name           = local.wiremock_connectivity_tester_name
  description    = "Docker maven artifact deployer container"
  build_timeout  = "60"
  queued_timeout = "480"
  service_role   = local.iam_role_arn
  tags           = local.tags

  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.wiremock_connectivity_tester_name
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.wiremock_connectivity_tester_file
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = var.curl_image
    type            = "LINUX_CONTAINER"
    privileged_mode = false
  }

  vpc_config {
    vpc_id             = local.vpc_id
    subnets            = local.private_subnet_ids
    security_group_ids = local.security_groups_ids
  }
}