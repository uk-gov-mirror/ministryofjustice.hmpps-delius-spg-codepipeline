{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
           "codebuild.amazonaws.com",
            "codepipeline.amazonaws.com",
            "ecs.amazonaws.com",
            "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}