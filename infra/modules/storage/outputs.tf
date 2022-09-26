output "bucket_name" {
  description = "The name of bucket"
  value       = google_storage_bucket.bucket.name
}