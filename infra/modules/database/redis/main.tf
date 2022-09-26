resource "google_redis_instance" "cache" {
  name           = var.redis_name
  tier           = "STANDARD_HA"
  memory_size_gb = 1

  location_id             = var.zone
  alternative_location_id = var.alternative_zone

  authorized_network = var.vpc_id
  connect_mode       = "PRIVATE_SERVICE_ACCESS"

  redis_version     = "REDIS_4_0"
  display_name      = "Terraform Test Instance"

  depends_on       = [var.db_depends_on]
}