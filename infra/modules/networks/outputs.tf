output "network" {
  value       = google_compute_network.vpc
  description = "The VPC"
}

output "subnet" {
  value       = google_compute_subnetwork.subnet
  description = "The subnet"
}

output "cluster_master_ip_cidr_range" {
  value       = local.cluster_master_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster master"
}

output "cluster_pods_ip_cidr_range" {
  value       = local.cluster_pods_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster pods"
}

output "cluster_services_ip_cidr_range" {
  value       = local.cluster_services_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster services"
}

output "link" {
  value       = google_compute_network.vpc.self_link
  description = "A link to the VPC resource, useful for creating resources inside the VPC"
}

output "private_vpc_connection" {
  description = "The private VPC connection"
  value       = google_service_networking_connection.private_vpc_connection
}

output "name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "vpc_id" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.id
}