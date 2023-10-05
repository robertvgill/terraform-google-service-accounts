resource "google_project_iam_member" "project_member_role" {
  for_each = { for idx, sa in local.sa_roles_flattened : "${sa["account_id"]}_${sa["role"]}" => sa }

  project    = var.project_id
  role       = replace(each.value["role"], "{{PROJECT_ID}}", var.project_id)
  member     = "serviceAccount:${each.value["account_id"]}@${var.project_id}.iam.gserviceaccount.com"

  depends_on = [google_service_account.service_account]
}