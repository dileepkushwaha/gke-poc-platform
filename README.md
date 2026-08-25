# gke-poc-platform

Disposable GKE platform experiments on Google Cloud.

## Principles

- Infrastructure is reproducible with Terraform.
- Git is the source of truth for platform configuration.
- No long-lived service-account keys.
- Continuously billed resources are destroyed after each experiment.
- Cost, security decisions, and resolved incidents are recorded in `docs/`.

## Repository layout

- `infra/terraform/` — infrastructure as code
- `deploy/` — GitOps manifests
- `apps/` — workload source
- `scripts/` — lifecycle helpers
- `docs/` — cost ledger, security notes, and runbook
