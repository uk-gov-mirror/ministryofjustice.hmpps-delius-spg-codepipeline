output "spg_ansible_task_runner_name" {
  value = aws_codebuild_project.spg-ansible-task-runner.name
}

output "spg_application_deployer_name" {
  value = aws_codebuild_project.spg-application-deployer.name
}

output "spg_docker_image_builder_name" {
  value = aws_codebuild_project.spg-docker-image-builder.name
}

output "spg_ec2_instantiator_name" {
  value = aws_codebuild_project.spg-ec2-instantiator.name
}

output "spg_ecr_cleaner_name" {
  value = aws_codebuild_project.spg-ecr-cleaner.name
}

output "spg_gatling_task_runner_name" {
  value = aws_codebuild_project.spg-gatling-task-runner.name
}

output "spg_gradle_application_builder_name" {
  value = aws_codebuild_project.spg-gradle-application-builder.name
}

output "spg_java_application_builder_name" {
  value = aws_codebuild_project.spg-java-application-builder.name
}

output "spg_maven_artifact_deployer_name" {
  value = aws_codebuild_project.spg-maven-artifact-deployer.name
}

output "spg_perf_tests_report_archiver_name" {
  value = aws_codebuild_project.spg-perf-tests-report-archiver.name
}

output "spg_perf_tests_results_aggregator_name" {
  value = aws_codebuild_project.spg-perf-tests-results-aggregator.name
}

output "spg_pre_stack_builder_name" {
  value = aws_codebuild_project.spg-pre-stack-builder.name
}

output "spg_stack_builder_name" {
  value = aws_codebuild_project.spg-stack-builder.name
}

output "spg_smoke_tests_runner_name" {
  value = aws_codebuild_project.spg-smoke-tests-runner.name
}

