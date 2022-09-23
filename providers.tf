provider "google" {
  project   = var.project_id
  region    = var.region
  zone      = var.main_zone
}
provider "google-beta" {
  project   = var.project_id
  region    = var.region
  zone      = var.main_zone
} 