terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

# =============================================================================
# GCP Resources (CPU-only GKE for lightweight pose detection)
# =============================================================================

module "gke_cluster" {
  source = "../modules/gke-cluster"

  project_id   = var.project_id
  zone         = var.zone
  cluster_name = var.cluster_name
}

module "artifact_registry" {
  source = "../modules/artifact-registry"

  project_id    = var.project_id
  region        = var.region
  repository_id = "dancesage"
}

module "github_actions_sa" {
  source = "../modules/github-actions-sa"

  project_id = var.project_id
}
