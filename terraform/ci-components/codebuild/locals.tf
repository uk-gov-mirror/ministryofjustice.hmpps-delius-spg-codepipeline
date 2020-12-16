locals {
  prefix = "spgw"

  stack_builder_name                      = "${local.prefix}-stack-builder-0-12${local.test_var}"
  java_application_builder_name           = "${local.prefix}-java-application-builder${local.test_var}"
  docker_image_builder_name               = "${local.prefix}-docker-image-builder${local.test_var}"
  application_deployer_name               = "${local.prefix}-application-deployer${local.test_var}"
  maven_artifact_publisher_name           = "${local.prefix}-maven-artifact-publisher${local.test_var}"
  ansible_task_runner_name                = "${local.prefix}-ansible-task-runner${local.test_var}"
  wiremock_connectivity_tester_name       = "${local.prefix}-wiremock-connectivity-tester${local.test_var}"
  pre_stack_builder_name                  = "${local.prefix}-pre-stack-builder${local.test_var}"
  smoke_tests_runner_name                 = "${local.prefix}-smoke-tests-runner${local.test_var}"
  perf_tests_results_aggregator_name      = "${local.prefix}-perf-tests-results-aggregator${local.test_var}"
  ec2_instantiator_name                   = "${local.prefix}-ec2-instantiator${local.test_var}"
  perf_tests_report_archiver_name         = "${local.prefix}-perf-tests-report-archiver${local.test_var}"
  gatling_task_runner_name                = "${local.prefix}-gatling-task-runner${local.test_var}"
  smoke_tests_results_archiver_name       = "${local.prefix}-smoke-tests-results-archiver${local.test_var}"
  gradle_application_builder_name         = "${local.prefix}-gradle-application-builder${local.test_var}"
  ecr_cleaner_name                        = "${local.prefix}-ecr-cleaner${local.test_var}"
  application_tests_results_archiver_name = "${local.prefix}-application-tests-results-archiver${local.test_var}"

  iam_role_arn = data.terraform_remote_state.common.outputs.codebuild_info["iam_role_arn"]

  tags           = data.terraform_remote_state.common.outputs.tags
  log_group_name = data.terraform_remote_state.common.outputs.codebuild_info["log_group"]

  stack_builder_file                      = "ci/buildspec-build-stack.yml"
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

  //TODO: remove this var, we want replace real codebuild, once ready
  test_var = "-test"

  // TODO: get the sg from hmpps-engineering-platform-terraform (vpc-sg-outbound-pipeline)
  security_groups_ids = [
    data.terraform_remote_state.vpc.outputs.vpc_sg_outbound_id,
    "sg-0460107d0b17f1862"
  ]


}
