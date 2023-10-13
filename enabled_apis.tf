locals {
  services = toset([
    "iam.googleapis.com",            # Identity and Access Management (IAM) API
    "iamcredentials.googleapis.com", # IAM Service Account Credentials API
  ])
}

resource "google_project_service" "service" {
  for_each = local.services

  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy         = var.disable_on_destroy
}