locals {
  network = "${element(split("-", var.subnet), 0)}"
}

resource "google_sql_database" "database" {
  name     = "${local.network}-database"
  instance = google_sql_database_instance.instance.name
}