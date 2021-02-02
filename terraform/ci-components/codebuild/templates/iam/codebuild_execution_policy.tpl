{
"Version": "2012-10-17",
"Statement": [
    {
    "Sid": "",
    "Effect": "Allow",
        "Action": [
            "ssm:*",
            "codebuild:*",
            "ec2:*",
            "ecr:*",
            "ecs:*",
            "iam:PassRole",
            "ec2:AssociateIamInstanceProfile",
            "ec2:ReplaceIamInstanceProfileAssociation",
            "sns:Publish"
        ],
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Sid": "AllowStartPipeLine",
        "Action": [
            "codepipeline:StartPipelineExecution",
            "codepipeline:GetPipelineExecution"
        ],
        "Resource": "*"
    },
    {
        "Sid": "S3Access",
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": [
        "arn:aws:s3:::eu-west-2-delius-core-dev-codebuild-cache/*",
        "arn:aws:s3:::eu-west-2-delius-core-dev-codebuild-cache",
        "arn:aws:s3:::eu-west-2-delius-core-dev-codebuild-artifacts/*",
        "arn:aws:s3:::eu-west-2-delius-core-dev-codebuild-artifacts"
    ]
    },
    {
    "Effect": "Allow",
    "Sid": "assumeAllEnvironmentBuildRoles",
    "Action": "sts:AssumeRole",
    "Resource": [
        "arn:aws:iam::563502482979:role/build",
        "arn:aws:iam::723123699647:role/build",
        "arn:aws:iam::301496033642:role/build",
        "arn:aws:iam::895523100917:role/build",
        "arn:aws:iam::895523100917:role/admin",
        "arn:aws:iam::431912413968:role/build",
        "arn:aws:iam::356676313489:role/build",
        "arn:aws:iam::434401102446:role/build",
        "arn:aws:iam::237599693891:role/build",
        "arn:aws:iam::574159866058:role/build",
        "arn:aws:iam::711258951176:role/build",
        "arn:aws:iam::728765553488:role/build",
        "arn:aws:iam::205048117103:role/build",
        "arn:aws:iam::130975965028:role/build",
        "arn:aws:iam::050243167760:role/build",
        "arn:aws:iam::010587221707:role/build",
        "arn:aws:iam::823824448821:role/build",
        "arn:aws:iam::486893912453:role/build",
        "arn:aws:iam::077643444046:role/build",
        "arn:aws:iam::350200336796:role/build",
        "arn:aws:iam::350200336796:role/build",
        "arn:aws:iam::716683748953:role/build",
        "arn:aws:iam::645753425509:role/build",
        "arn:aws:iam::130847504577:role/build",
        "arn:aws:iam::330914586320:role/build",
        "arn:aws:iam::479759138745:role/build"
        ]
    },
{
"Effect": "Allow",
"Sid": "assumeAllEnvironmentTerraformRoles",
"Action": "sts:AssumeRole",
    "Resource": [
        "arn:aws:iam::563502482979:role/terraform",
        "arn:aws:iam::723123699647:role/terraform",
        "arn:aws:iam::301496033642:role/terraform",
        "arn:aws:iam::895523100917:role/terraform",
        "arn:aws:iam::431912413968:role/terraform",
        "arn:aws:iam::356676313489:role/terraform",
        "arn:aws:iam::434401102446:role/terraform",
        "arn:aws:iam::237599693891:role/terraform",
        "arn:aws:iam::574159866058:role/terraform",
        "arn:aws:iam::711258951176:role/terraform",
        "arn:aws:iam::728765553488:role/terraform",
        "arn:aws:iam::205048117103:role/terraform",
        "arn:aws:iam::130975965028:role/terraform",
        "arn:aws:iam::050243167760:role/terraform",
        "arn:aws:iam::010587221707:role/terraform",
        "arn:aws:iam::823824448821:role/terraform",
        "arn:aws:iam::486893912453:role/terraform",
        "arn:aws:iam::077643444046:role/terraform",
        "arn:aws:iam::350200336796:role/terraform",
        "arn:aws:iam::716683748953:role/terraform",
        "arn:aws:iam::645753425509:role/terraform",
        "arn:aws:iam::130847504577:role/terraform",
        "arn:aws:iam::330914586320:role/terraform",
        "arn:aws:iam::479759138745:role/terraform",
        "arn:aws:iam::570551521311:role/terraform"
    ]
}
]
}