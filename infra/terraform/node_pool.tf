resource "google_container_node_pool" "dev_spot" {
  name       = "dev-spot"
  cluster    = google_container_cluster.dev.id
  location   = var.zone
  node_count = 2

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "e2-standard-2"
    spot         = true
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
