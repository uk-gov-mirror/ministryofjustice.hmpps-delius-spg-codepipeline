locals {
  prefix = "spgw"

  stack_builder_name                 = "${local.prefix}-stack-builder-0-12"
  stack_builder_name_plan            = "${local.stack_builder_name}-plan"
  stack_builder_name_apply           = "${local.stack_builder_name}-apply"
  java_application_builder_name      = "${local.prefix}-java-application-builder"
  docker_image_builder_name          = "${local.prefix}-docker-image-builder"
  application_deployer_name          = "${local.prefix}-application-deployer"
  maven_artifact_publisher_name      = "${local.prefix}-maven-artifact-publisher"
  ansible_task_runner_name           = "${local.prefix}-ansible-task-runner"
  wiremock_connectivity_tester_name  = "${local.prefix}-wiremock-connectivity-tester"
  pre_stack_builder_name             = "${local.prefix}-pre-stack-builder"
  smoke_tests_runner_name            = "${local.prefix}-smoke-tests-runner"
  perf_tests_results_aggregator_name = "${local.prefix}-perf-tests-results-aggregator"
  ec2_instantiator_name              = "${local.prefix}-ec2-instantiator"
  perf_tests_report_archiver_name    = "${local.prefix}-perf-tests-report-archiver"
  gatling_task_runner_name           = "${local.prefix}-gatling-task-runner"
  smoke_tests_results_archiver_name  = "${local.prefix}-smoke-tests-results-archiver"
  gradle_application_builder_name    = "${local.prefix}-gradle-application-builder"
  ecr_cleaner_name                   = "${local.prefix}-ecr-cleaner"

  iam_role_arn = data.terraform_remote_state.common.outputs.codebuild_info["iam_role_arn"]

  tags           = data.terraform_remote_state.common.outputs.tags
  log_group_name = data.terraform_remote_state.common.outputs.codebuild_info["log_group"]

  stack_builder_file                      = "ci/buildspec-build-stack.yml"
  stack_builder_plan_file                 = "ci/buildspec-build-stack-plan.yml"
  stack_builder_apply_file                = "ci/buildspec-build-stack-apply.yml"
  java_application_file                   = "ci/buildspec-build-application.yml"
  docker_image_file                       = "ci/buildspec-build-docker-image.yml"
  application_deployer_file               = "ci/buildspec-deploy-application.yml"
  maven_artifact_publisher_file           = "ci/buildspec-maven-artifact-publisher.yml"
  ansible_task_runner_file                = "ci/buildspec-run-ansible-task.yml"
  wiremock_connectivity_tester_file       = "ci/buildspec-wiremock-connectivity-test.yml"
  alfresco_proxy_pre_stack_builder_file   = "ci/buildspec-pre-build-stack.yml"
  smoke_tests_runner_file                 = "ci/buildspec.yml"
  perf_tests_results_aggregator_file      = "ci/buildspec-collate-test-results.yml"
  ec2_instantiator_file                   = "ci/buildspec-init-ec2-instances.yml"
  perf_tests_report_archiver_file         = "ci/buildspec-archive-test-report.yml"
  gatling_task_runner_file                = "ci/buildspec-run-gatling-task.yml"
  smoke_tests_results_archiver_file       = "ci/buildspec-archive-smoke-tests-results.yml"
  gradle_application_builder_file         = "ci/buildspec-build-application.yml"
  ecr_cleaner_file                        = "ci/buildspec-clean-up-ecr.yml"
  application_tests_results_archiver_file = "ci/buildspec-archive-application-tests-results.yml"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  private_subnet_ids = [
    data.terraform_remote_state.vpc.outputs.private-subnet-az1,
    data.terraform_remote_state.vpc.outputs.private-subnet-az2,
    data.terraform_remote_state.vpc.outputs.private-subnet-az3,
  ]

  // TODO: get the sg from hmpps-engineering-platform-terraform (vpc-sg-outbound-pipeline)
  security_groups_ids = [
    data.terraform_remote_state.vpc.outputs.vpc_sg_outbound_id,
    "sg-0460107d0b17f1862"
  ]
}
