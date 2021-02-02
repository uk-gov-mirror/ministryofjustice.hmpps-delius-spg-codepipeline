#!/usr/bin/env bash

# ${1} - the aws environment
# ${2} - the script to run: plan or apply
# See Makefile for usage

#rm -rf terraform/ci_env_configs
#git clone git@github.com:ministryofjustice/hmpps-engineering-platform-terraform.git
#mv hmpps-engineering-platform-terraform/env_configs terraform/ci_env_configs
#rm -rf hmpps-engineering-platform-terraform

docker run -it --rm \
    -v $(pwd):/home/tools/data \
    -v ~/.aws:/home/tools/.aws \
    -e AWS_PROFILE=hmpps-token \
    -e TF_LOG=INFO \
    -e HMPPS_BUILD_WORK_DIR=/home/tools/data/terraform \
    -e environment_name="${1}" \
    -e "TERM=xterm-256color" \
    --entrypoint "scripts/${2}" \
    mojdigitalstudio/hmpps-terraform-builder-0-12