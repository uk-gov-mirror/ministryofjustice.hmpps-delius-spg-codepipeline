default: sandpit-plan
.PHONY: sandpit-plan

ci-plan:
	scripts/terraform-local-builder.sh delius-core-dev terraform-local-plan.sh

ci-apply:
	scripts/terraform-local-builder.sh delius-core-dev terraform-local-apply.sh

ci-destroy:
	scripts/terraform-local-builder.sh delius-core-dev terraform-local-destroy.sh