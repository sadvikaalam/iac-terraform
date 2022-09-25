resource "google_project_service" "vpcaccess_api" {
  service  = "vpcaccess.googleapis.com"
  provider = google-beta
  disable_on_destroy = false
}

resource "google_vpc_access_connector" "connector" {
  name          = "vpcconn"
  provider      = google-beta
  region        = "us-west1"
  ip_cidr_range = "10.8.0.0/28"
  max_throughput= 300
  network       = google_compute_network.default.name
  depends_on    = [google_project_service.vpcaccess_api]
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./path/to/zip/file/which/contains/code"
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "nodejs16"

  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.bucket.name
  source_archive_object        = google_storage_bucket_object.archive.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = "helloGET"
  labels = {
    my-label = "my-label-value"
  }

  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
}

# IAM entry for a single user to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "user:myFunctionInvoker@example.com"
}