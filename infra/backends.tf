terraform {
  backend "gcs" {
    bucket = "airy-actor-359701-terraform"
    prefix = "terraform-state"
  }
  # backend "local" {
  #   path = "relative/path/to/terraform.tfstate"
  # }
}