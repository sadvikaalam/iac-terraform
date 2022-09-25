module "google_networks" {
  source = "./modules/networks"

  project_id = var.project_id
  region     = var.region
}

module "bastion" {
  source = "./modules/bastion"

  project_id   = var.project_id
  region       = var.region
  zone         = var.main_zone
  bastion_name = "app-cluster"
  network_name = module.google_networks.network.name
  subnet_name  = module.google_networks.subnet.name
}

module "google_kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"

  project_id                 = var.project_id
  region                     = var.region
  node_zones                 = var.cluster_node_zones
  network_name               = module.google_networks.network.name
  subnet_name                = module.google_networks.subnet.name
  master_ipv4_cidr_block     = module.google_networks.cluster_master_ip_cidr_range
  pods_ipv4_cidr_block       = module.google_networks.cluster_pods_ip_cidr_range
  services_ipv4_cidr_block   = module.google_networks.cluster_services_ip_cidr_range
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
}

module "cloudsql" {
  source = "./modules/database/cloudsql"

  disk_size     = 10
  instance_type = "db-f1-micro"
  password      = var.db_password 
  user          = var.db_username
  vpc_name      = module.google_networks.name
  vpc_link      = module.google_networks.link
  db_depends_on = module.google_networks.private_vpc_connection
}

module "redis" {
  source = "./modules/database/redis"

  redis_name        = "redis-main-server"
  zone              = var.main_zone
  alternative_zone  = var.alternative_zone
  vpc_id            = module.google_networks.vpc_id
  db_depends_on     = module.google_networks.private_vpc_connection
}

