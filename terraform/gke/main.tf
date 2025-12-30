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
