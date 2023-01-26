terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  #credentials = "https://github.com/rks1402/GCP_Terraform/blob/f043ab1b591a3747ddbbbccc15f53344e87e0e83/bucket-function-datastore-e5cdd29962e8.json"

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

