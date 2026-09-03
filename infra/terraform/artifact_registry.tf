resource "google_artifact_registry_repository" "apps" {
  repository_id = "${var.environment}-apps"
  location      = var.region
  format        = "DOCKER"
  description   = "Container images and Helm charts for the ${var.environment} environment"
}
