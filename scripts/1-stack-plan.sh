#!/usr/bin/env bash
set -e

env | sort

    if [ -d .terraform ]; then
        rm -rf .terraform
    fi
    rm -f ${environment_name}.plan
    sleep 1
    terragrunt fmt
    terragrunt init
    terragrunt refresh
    terragrunt plan --out ${environment_name}.plan

set -e