resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = "US"
}

resource "google_storage_bucket" "bucket_2" {
  name     = "${var.bucket_name}-2"
  location = "US"
}