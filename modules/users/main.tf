locals {
  network = "${element(split("-", var.subnet), 0)}"
}

resource "google_sql_user" "users" {
  name     = "rahul"
  instance = google_sql_database_instance.instance.name
  password = "rahul"
}