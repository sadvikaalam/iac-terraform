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
  network       = var.vpc_name
  depends_on    = [google_project_service.vpcaccess_api]
}

# resource "google_storage_bucket_object" "archive" {
#   name   = "index.zip"
#   bucket = var.bucket_name
#   source = "./hello-world"
# }

# resource "google_cloudfunctions_function" "function" {
#   name        = "function-test"
#   description = "My function"
#   runtime     = "nodejs16"

#   available_memory_mb          = 128
#   source_archive_bucket        = var.bucket_name
#   source_archive_object        = google_storage_bucket_object.archive.name
#   trigger_http                 = true
#   https_trigger_security_level = "SECURE_ALWAYS"
#   timeout                      = 60
#   entry_point                  = "helloWorld"
#   labels = {
#     my-label = "my-label-value"
#   }

#   environment_variables = {
#     MY_ENV_VAR = "my-env-var-value"
#   }
# }
