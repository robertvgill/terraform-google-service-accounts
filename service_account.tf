resource "google_service_account" "service_account" {
  for_each = local.service_accounts

  project      = format("%s", var.project_id)
  account_id   = each.value["account_id"]
  display_name = each.value["display_name"]
  description  = each.value["description"]

  depends_on = [
    google_project_service.service,
  ]
}

resource "google_service_account_iam_member" "service_account_iam" {
  for_each = local.service_accounts

  service_account_id = "projects/${var.project_id}/serviceAccounts/${each.value["account_id"]}@${var.project_id}.iam.gserviceaccount.com"
  role               = each.value["owner_role"]
  member             = each.value["owner_email"]

  depends_on         = [google_service_account.service_account]
}