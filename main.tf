terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(bucket-function-datastore-e5cdd29962e8.json)

  project = var.project
  region  = var.region
}

resource "google_sql_database" "database" {
  name     = "database_1"
  instance = google_sql_database_instance.instance.name
}


resource "google_sql_database_instance" "instance" {
  name             = "pstgsq"
  region           = "us-west1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }

}

resource "google_sql_user" "users" {
  name     = "rahul"
  instance = google_sql_database_instance.instance.name
  password = "rahul"
}

