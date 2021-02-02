#!/usr/bin/env bash
set -e

rm -rf terraform/env_configs
git clone https://github.com/ministryofjustice/hmpps-env-configs.git terraform/env_configs

source ${HMPPS_BUILD_WORK_DIR}/env_configs/${environment_name}/${environment_name}.properties

cd ${HMPPS_BUILD_WORK_DIR}/ci-components/codebuild


env | sort

  if [ -d .terraform ]; then
    rm -rf .terraform
  fi
  sleep 1
  terragrunt destroy


set +e
