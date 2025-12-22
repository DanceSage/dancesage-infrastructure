variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "min_gpu_nodes" {
  description = "Minimum GPU nodes (can be 0)"
  type        = number
  default     = 0
}

variable "max_gpu_nodes" {
  description = "Maximum GPU nodes"
  type        = number
  default     = 2
}