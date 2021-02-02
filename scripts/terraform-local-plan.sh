#!/usr/bin/env bash

#source ${HMPPS_BUILD_WORK_DIR}/ci_env_configs/dev.properties
#cd ${HMPPS_BUILD_WORK_DIR}/ci-components/codebuild

rm -rf terraform/env_configs
git clone https://github.com/ministryofjustice/hmpps-env-configs.git terraform/env_configs

source ${HMPPS_BUILD_WORK_DIR}/env_configs/${environment_name}/${environment_name}.properties

cd ${HMPPS_BUILD_WORK_DIR}/ci-components/codebuild

/home/tools/data/scripts/1-stack-plan.sh