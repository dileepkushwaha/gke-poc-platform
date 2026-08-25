# Security Notes

## Chapter 1 — Project, billing, and IAM

- No service-account JSON keys have been created or downloaded.
- `terraform-deployer` is a dedicated infrastructure identity with initial GKE, network, IAM service-account, and Artifact Registry administration roles.
- `stream-ci` has no roles until a later GitHub Actions Workload Identity Federation setup.
- Billing budget alerts are a notification mechanism, not a spending cap.
- Terraform will use service-account impersonation; GitHub Actions will use keyless federation.
