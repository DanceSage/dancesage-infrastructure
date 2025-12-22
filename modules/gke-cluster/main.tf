resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "cpu_nodes" {
  name       = "cpu-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  project    = var.project_id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 30

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}