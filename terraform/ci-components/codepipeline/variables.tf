variable "iam_role_arn" {
  description = "ARN of the IAM role that enables AWS CodePipeline to interact with the required AWS services."
  type        = string
}

variable "github_repositories" {
  type = map(list(string))
}

variable "repo_owner" {
  default = "ministryofjustice"
  type    = string
}

variable "artefacts_bucket" {
  description = "Name of the S3 bucket to use for storing build and pipeline artifacts."
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "codebuild_name" {
  type = string
}

variable "pipeline_name" {
  type    = string
  default = "security-access"
}

variable "log_group" {
  type = string
}

variable "stages" {
  type = list(object({
    name = string
    actions = list(object({
      codebuild_name   = string
      action_name      = string
      action_env       = string
      input_artifacts  = string
      output_artifacts = string
      namespace        = string
    }))
  }))
}

variable "action_env" {
  type    = string
  default = null
}

variable "cache_bucket" {
  type = string
}

variable "approval_required" {
  description = "Whether the Terraform planned changes must be approved before applying."
  default     = true
}

variable "is_dev" {
  type = number
  default = 1
}
