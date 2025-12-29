data "google_project" "project" {
  project_id = var.project_id
}

output "project_info" {
  value = {
    project_id     = data.google_project.project.project_id
    project_number = data.google_project.project.number
    name           = data.google_project.project.name
  }
  description = "GCP project information"
}
