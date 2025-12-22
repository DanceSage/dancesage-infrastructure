variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "min_gpu_nodes" {
  description = "Minimum GPU nodes"
  type        = number
  default     = 0
}

variable "max_gpu_nodes" {
  description = "Maximum GPU nodes"
  type        = number
  default     = 1
}