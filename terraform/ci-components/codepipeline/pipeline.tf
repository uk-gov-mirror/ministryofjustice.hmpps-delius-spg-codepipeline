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
          for action in stage.value.actions : [
            for count in local.content_count : {
              myName    = action.value.action_name + count
            }
          ]
        ])

        content {
          #name = action.value.action_name + var.name_suffix
          name = "${action.value.myName}"
          #category         = length(action.value.action_category) > 1 ? action.value.action_category : "Build"
          category = "Build"
          owner = "AWS"
          #provider         = length(action.value.action_provider) > 1 ? action.value.action_provider : "AWS"
          provider = "AWS"
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