resource "google_project_iam_member" "project_member_role" {
  for_each = {
    for k, v in var.service_accounts : k => v
    if v.create
  }

  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.service_account[each.key].email}"
}