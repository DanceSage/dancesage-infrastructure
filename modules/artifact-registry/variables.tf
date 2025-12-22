variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region for the registry"
  type        = string
}

variable "repository_id" {
  description = "Repository ID (name)"
  type        = string
  default     = "dancesage"
}

variable "description" {
  description = "Repository description"
  type        = string
  default     = "Docker images for DanceSage"
}

