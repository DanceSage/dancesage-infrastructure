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

  project_id   = var.project_id
  zone         = var.zone
  cluster_name = var.cluster_name
}

module "gpu_nodepool" {
  source = "../modules/gpu-nodepool"

  project_id     = var.project_id
  zone           = var.zone
  cluster_name   = module.gke_cluster.cluster_name
  min_node_count = var.min_gpu_nodes
  max_node_count = var.max_gpu_nodes
}
