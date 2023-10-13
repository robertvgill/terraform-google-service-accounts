## access token
variable "google_access_token_file" {
  description = "Google Cloud access token file."
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "(Required) The project ID to create the application under. ~>NOTE: GCP only accepts project ID, not project number. If you are using number, you may get a `Permission denied` error."
  type        = string
  default     = ""
}

variable "location_id" {
  description = "(Required) The location to serve the app from."
  type        = string
  default     = ""
}

## service account
/**
variable "service_accounts" {
  description = "The list of service accounts necessary for the project."
}
**/
variable "disable_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = true
  type        = bool
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = true
  type        = bool
}