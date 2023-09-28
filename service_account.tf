resource "google_service_account" "service_account" {
  for_each = {
    for k, v in var.service_accounts : k => v
    if v.create
  }

  project      = format("%s", var.project_id)
  account_id   = lookup(each.value, "account_id", null)
  display_name = lookup(each.value, "display_name", null)
  description  = lookup(each.value, "description", null)
}