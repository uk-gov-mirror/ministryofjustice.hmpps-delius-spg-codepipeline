#!/usr/bin/env bash

source ${HMPPS_BUILD_WORK_DIR}/ci_env_configs/dev.properties
cd ${HMPPS_BUILD_WORK_DIR}/ci-components/codebuild

/home/tools/data/scripts/1-stack-plan.sh