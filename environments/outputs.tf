# =============================================================================
# GCP Outputs
# =============================================================================

output "gke_cluster_name" {
  description = "GKE cluster name"
  value       = module.gke_cluster.cluster_name
}

output "gke_cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke_cluster.cluster_endpoint
  sensitive   = true
}

output "artifact_registry_url" {
  description = "Artifact Registry URL for pushing images"
  value       = module.artifact_registry.repository_url
}

output "github_actions_sa_email" {
  description = "GitHub Actions service account email"
  value       = module.github_actions_sa.service_account_email
}

output "github_actions_sa_key" {
  description = "GitHub Actions service account key (add this to GitHub Secrets as GCP_SA_KEY)"
  value       = module.github_actions_sa.service_account_key
  sensitive   = true
}
