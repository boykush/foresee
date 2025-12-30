variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-northeast1"
}

variable "enable_gke" {
  description = "Enable GKE cluster creation. Set to false to delete the cluster and save costs."
  type        = bool
  default     = true
}
