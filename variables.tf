variable "project_id" {
  type = string
  description = "The ID of the project to create resources in"
}

variable "region" {
  type = string
  description = "The region to use"
}

variable "main_zone" {
  type = string
  description = "The zone to use as primary"
}

variable "cluster_node_zones" {
  type = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}

variable "credentials_file_path" {
  type = string
  description = "The credentials JSON file used to authenticate with GCP"
}

variable "db_username" {
  description = "The Postgres username"
  type = string
}

variable "db_password" {
  description = "The Postgres password"
  type        = string
  sensitive   = true
}

variable "alternative_zone" {
  description = "The alternative zone where redis server is located"
  type        = string
}


