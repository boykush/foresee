data "google_project" "project" {
  project_id = var.project_id
}

# Artifact Registry repository for Docker images
module "artifact_registry" {
  source = "./artifact-registry"

  region = var.region
}

# GitHub Actions Service Account and Workload Identity
module "github_actions_sa" {
  source = "./service-accounts/github-actions"

  project_id = var.project_id
}

# GKE Autopilot cluster
module "gke" {
  count  = var.enable_gke ? 1 : 0
  source = "./gke"

  project_id     = var.project_id
  project_number = data.google_project.project.number
}
