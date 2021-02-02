variable "remote_state_bucket_name" {
  description = "Terraform remote state bucket name"
}

variable "short_environment_name" {
  type = string
}
variable "region" {
  description = "The AWS region."
}

variable "terraform_image" {
  description = "The terraform image for codebuild."
}

variable "aws_codebuild_image" {
  description = "The java image for codebuild."
}
variable "aws_ecs_image" {
  description = "The ecs image for codebuild."
}

variable "ansible_task_runner_java_image" {
  description = "The ansible java task runner for codebuild."
}

variable "curl_image" {
  description = "The image for wiremock-connectivity-tester codebuild."
}

variable "gatling_image" {
  description = "The gatling-task-runner image codebuild."
}

variable "aws_cli_image" {
  description = "The smoke-tests-results-archiver image codebuild."
}


variable "tags" {
  type = map(string)
}


variable "environment_name" {
  type = string
}


variable "project_name" {
  description = "The project name - eg delius (and delius-core)"
}

variable "environment_type" {
  description = "The project name - eg delius (and delius-core)"
}

