locals {
  network = "${element(split("-", var.subnet), 0)}"
}

resource "google_sql_database_instance" "instance" {
  name             = "${local.network}-psql-instance"
  region           = "us-west1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }
  
}