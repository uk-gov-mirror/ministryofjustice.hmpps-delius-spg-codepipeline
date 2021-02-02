resource "aws_security_group" "vpc-sg-outbound-pipeline" {
  name        = "${var.short_environment_name}-vpc-sg-outbound-pipeline"
  description = "security group for ${var.short_environment_name}-vpc-outbound-codepipeline-traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port   = "8181"
    to_port     = "8181"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SPG CI Pipeline Smoke Tests to Public 8181"
  }

  egress {
    from_port   = "9001"
    to_port     = "9001"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SPG CI Pipeline Smoke Tests to Public 9001"
  }

  egress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "To prime standalone Wiremock"
  }

  egress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SPG CI Pipeline Gatling Tests to Private 22"
  }

  egress {
    from_port   = "2222"
    to_port     = "2222"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "MTS CI Pipeline Tests to Public 2222"
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.short_environment_name}-outbound-codepipeline-traffic"
    },
  )
}