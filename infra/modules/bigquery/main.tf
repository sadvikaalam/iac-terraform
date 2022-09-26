resource "google_service_account" "bqowner" {
  account_id    = "bqowner"
  display_name  = "Bigquery Service Account"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.name
  friendly_name               = "test"
  description                 = "This is a bigquery description"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }
  
  access {
    role          = "OWNER"
    user_by_email = "syarohalam@gmail.com"
  }

#   access {
#     role   = "READER"
#     domain = "singorojo.my.id"
#   }
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "testing"

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}
