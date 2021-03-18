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
            #for type in local.content_type : {
            for runOrder, type in local.countent_type_map : {
              action_name    = format("%s%s", myAction.action_name, type)
              input_artifacts = myAction.input_artifacts
              output_artifacts = myAction.output_artifacts
              namespace = myAction.namespace
              codebuild_name = myAction.codebuild_name
              action_env = myAction.action_env
              action_provider = myAction.action_provider
              action_category = myAction.action_category
              action_type = type
              run_order = index(stage.value.actions, myAction)
            }
          ]
        ])

        content {
          name = action.value.action_name
          owner = "AWS"
          version = "1"
          category = action.value.action_type == "Approve" ? "Approval" : action.value.action_category
          provider = action.value.action_type == "Approve" ? "Manual" : action.value.action_provider
          run_order = action.value.run_order
          input_artifacts = action.value.action_type == "Approve" ? null : [action.value.input_artifacts]
          output_artifacts = action.value.action_type == "Plan" ? [action.value.output_artifacts] : null
          namespace = action.value.action_type == "Plan" ? action.value.namespace : null
          configuration = action.value.action_type == "Approve" ? null : {
            ProjectName = action.value.codebuild_name
            EnvironmentVariables = action.value.action_env
          }
        }
      }
    }
  }
}