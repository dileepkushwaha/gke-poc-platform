resource "google_service_account" "node" {
  account_id   = "gke-node-sa"
  display_name = "GKE node service account"
}

resource "google_project_iam_member" "node_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.node.email}"
}
resource "google_project_iam_member" "node_monitoring_metric" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.node.email}"
}
resource "google_project_iam_member" "node_monitoring_viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "serviceAccount:${google_service_account.node.email}"
}
resource "google_project_iam_member" "node_container" {
  project = var.project_id
  role    = "roles/container.nodeServiceAccount"
  member  = "serviceAccount:${google_service_account.node.email}"
}
resource "google_project_iam_member" "node_artifact" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.node.email}"
}

resource "google_service_account_iam_member" "deployer_use_node_sa" {
  service_account_id = google_service_account.node.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:terraform-deployer@gke-poc-dileep.iam.gserviceaccount.com"
}
