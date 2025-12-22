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

module "gke_cluster" {
  source = "../modules/gke-cluster"

  project_id    = var.project_id
  zone          = var.zone
  cluster_name  = var.cluster_name
  min_gpu_nodes = var.min_gpu_nodes
  max_gpu_nodes = var.max_gpu_nodes
}