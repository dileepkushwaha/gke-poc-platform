# gke-poc-platform — Terraform lifecycle (implementation repo)
# Owns the IaC lifecycle for the dev/prod workspaces. The curriculum repo's
# Makefile delegates here for `up`/`down`. State bucket + Artifact Registry
# survive `down` (creation-charged only; images persist across sessions).

SHELL := /usr/bin/env bash
TF_DIR := infra/terraform
ENV    := dev

.PHONY: help up down plan validate fmt status

help: ## this list
	@grep -hE '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN{FS=":.*?## "}{printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

fmt: ## format all Terraform files (run before pushing — CI enforces it)
	cd $(TF_DIR) && terraform fmt -recursive

validate: ## validate Terraform config (no backend/creds needed)
	cd $(TF_DIR) && terraform init -backend=false && terraform validate

plan: ## plan the dev workspace
	cd $(TF_DIR) && terraform workspace select $(ENV) && terraform plan -var-file=envs/$(ENV).tfvars

up: ## apply dev workspace + get credentials + smoke check
	cd $(TF_DIR) && terraform workspace select $(ENV) && terraform apply -var-file=envs/$(ENV).tfvars
	@echo "== getting kubeconfig for the dev cluster =="
	@gcloud container clusters get-credentials gke-poc-dev-cluster --zone us-central1-a --project gke-poc-dileep
	@echo "== smoke check: nodes =="
	@kubectl get nodes

down: ## destroy dev workspace (keeps state bucket + Artifact Registry)
	cd $(TF_DIR) && terraform workspace select $(ENV) && terraform destroy -var-file=envs/$(ENV).tfvars

status: ## what the dev workspace manages
	cd $(TF_DIR) && terraform workspace select $(ENV) && terraform state list
