variable "redis_name" {
  description = "The name of redis server"
  type        = string
}

variable "zone" {
  description = "The zone where redis server is located"
  type        = string
}

variable "alternative_zone" {
  description = "The alternative zone where redis server is located"
  type        = string
}

variable "db_depends_on" {
  description = "A single resource that the database instance depends on"
  type        = any
}

variable "vpc_id" {
  description = "The virtual private network where database is connect to privately"
  type        = any
}