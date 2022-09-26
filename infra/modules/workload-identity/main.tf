resource "google_service_account" "workload-identity-user-sa" {
  account_id   = "workload-identity-tutorial"
  display_name = "Service Account For Workload Identity"
}

resource "google_project_iam_member" "storage-role" {
  role = "roles/storage.admin"
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.workload-identity-user-sa.email}"
}

resource "google_project_iam_member" "workload_identity-role" {
  role   = "roles/iam.workloadIdentityUser"
  member = "serviceAccount:${var.project}.svc.id.goog[workload-identity-test/workload-identity-user]"
}