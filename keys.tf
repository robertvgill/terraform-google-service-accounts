resource "google_service_account_key" "service_account" {
  for_each = {
    for k, v in var.service_accounts : k => v
    if v.create && v.generate_keys
  }

  service_account_id = google_service_account.service_account[each.key].email
}

resource "local_file" "service_account" {
  for_each = {
    for k, v in var.service_accounts : k => v
    if v.create && v.generate_keys
  }

  content              = base64decode(google_service_account_key.service_account[each.key].private_key)
  directory_permission = "0644"
  file_permission      = "0644"
  filename             = "${path.module}/${each.value.display_name}.json"
}