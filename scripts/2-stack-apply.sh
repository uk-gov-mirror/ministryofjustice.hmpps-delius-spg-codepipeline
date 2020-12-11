#!/usr/bin/env bash
set -e

env | sort

terragrunt apply ${environment_name}.plan
