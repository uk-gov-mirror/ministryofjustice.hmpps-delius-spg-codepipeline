#!/usr/bin/env bash

source ${HMPPS_BUILD_WORK_DIR}/env_configs/${environment_name}/${environment_name}.properties

cd ${HMPPS_BUILD_WORK_DIR}/ci-components/codebuild


/home/tools/data/scripts/2-stack-apply.sh