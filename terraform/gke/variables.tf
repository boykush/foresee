variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "project_number" {
  description = "GCP project number"
  type        = string
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "foresee-cluster"
}

variable "region" {
  description = "GCP region for the cluster"
  type        = string
  default     = "asia-northeast1"
}
