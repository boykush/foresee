resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Autopilot cluster
  enable_autopilot = true

  # Release channel for automatic upgrades
  release_channel {
    channel = "REGULAR"
  }
}

# Grant Artifact Registry Reader role to default Compute Engine service account
resource "google_project_iam_member" "gke_artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
}
