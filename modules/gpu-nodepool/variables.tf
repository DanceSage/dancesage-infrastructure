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

variable "min_node_count" {
  description = "Minimum number of GPU nodes"
  type        = number
  default     = 0
}

variable "max_node_count" {
  description = "Maximum number of GPU nodes"
  type        = number
  default     = 1
}

variable "gpu_type" {
  description = "GPU type (e.g., nvidia-tesla-t4)"
  type        = string
  default     = "nvidia-tesla-t4"
}

variable "machine_type" {
  description = "Machine type for GPU nodes"
  type        = string
  default     = "n1-standard-4"
}

