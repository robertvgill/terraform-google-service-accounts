## access token
variable "google_access_token_file" {
  description = "Google Cloud access token file."
  type        = string
  sensitive   = true
}

## service account
variable "project_id" {
  description = "(Optional) The ID of the project that the service account will be created in. Defaults to the provider project configuration."
  type        = string
  default     = ""
}

variable "service_accounts" {
  description = "Names of the service accounts to create."
  default     = {}
}