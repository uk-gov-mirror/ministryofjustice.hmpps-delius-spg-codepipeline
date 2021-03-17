resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline_name
  role_arn = var.iam_role_arn
  tags = merge(var.tags, {
    Name = var.pipeline_name
  })

  artifact_store {
    type     = "S3"
    location = var.artefacts_bucket
  }

  stage {
    name = "Source"
    dynamic "action" {
      for_each = var.github_repositories
      content {
        name             = action.key
        category         = "Source"
        owner            = "ThirdParty"
        provider         = "GitHub"
        version          = "1"
        output_artifacts = [action.key]
        configuration = {
          Owner                = var.repo_owner
          Repo                 = action.value[0]
          Branch               = length(action.value) > 1 ? action.value[1] : "develop"
          PollForSourceChanges = true
          OAuthToken           = data.aws_ssm_parameter.ami.value
        }
      }
    }
  }

  dynamic "stage" {
    for_each = var.stages
    content {
      name = stage.value.name

      # Apply
      dynamic "action" {

        for_each = flatten([
          for myAction in stage.value.actions : [
            for count in local.content_count : {
              action_name    = format("%s%s", myAction.action_name, count)
              input_artifacts = myAction.input_artifacts
              output_artifacts = myAction.output_artifacts
              namespace = myAction.namespace
              codebuild_name = myAction.codebuild_name
              action_env = myAction.action_env
              action_provider = myAction.action_provider
              action_category = myAction.action_category
            }
          ]
        ])

        content {
          #name = action.value.action_name + var.name_suffix
          name = action.value.action_name
          category = action.value.action_category
          owner = "AWS"
          provider = action.value.action_provider
          version = "1"
          run_order = 3
          input_artifacts = [action.value.input_artifacts]
          output_artifacts = [action.value.output_artifacts]
          namespace = action.value.namespace
          configuration = {
            ProjectName = action.value.codebuild_name
            EnvironmentVariables = action.value.action_env
          }
        }
      }
    }
  }
}