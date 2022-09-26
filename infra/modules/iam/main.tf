resource "google_service_account" "testing" {
  account_id    = "testing"
   display_name = "Testing Service Account"
}

resource "google_project_iam_member" "member-role" {
  for_each = toset([
    "roles/cloudsql.admin",
    "roles/secretmanager.secretAccessor",
    "roles/datastore.owner",
    "roles/storage.admin",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.testing.email}"
  project = var.project_id
}