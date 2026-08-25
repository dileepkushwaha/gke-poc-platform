# Security Notes

## Chapter 1 — Project, billing, and IAM

- No service-account JSON keys have been created or downloaded.
- `terraform-deployer` is a dedicated infrastructure identity with initial GKE, network, IAM service-account, and Artifact Registry administration roles.
- `stream-ci` has no roles until a later GitHub Actions Workload Identity Federation setup.
- Billing budget alerts are a notification mechanism, not a spending cap.
- Terraform will use service-account impersonation; GitHub Actions will use keyless federation.

## Repository guardrails

- `main` requires a pull request and a passing Gitleaks check.
- Force pushes and branch deletion are blocked on `main`.
- GitHub Secret Protection and push protection are enabled.
- Gitleaks runs locally against staged changes through `.githooks/pre-commit`.
- Code ownership is declared in `.github/CODEOWNERS`.
