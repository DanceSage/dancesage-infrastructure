# Service account for GitHub Actions to deploy to GKE
resource "google_service_account" "github_actions" {
  project      = var.project_id
  account_id   = "github-actions"
  display_name = "GitHub Actions"
  description  = "Service account for GitHub Actions CI/CD"
}

# Allow deploying to GKE
resource "google_project_iam_member" "gke_developer" {
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Allow pulling images from Artifact Registry
resource "google_project_iam_member" "artifact_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Create a key for the service account
resource "google_service_account_key" "github_actions_key" {
  service_account_id = google_service_account.github_actions.name
}

