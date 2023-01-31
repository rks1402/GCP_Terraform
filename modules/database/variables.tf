variable "project" {}
variable "subnet" {}
variable "google_sql_database_instance" {
    name = string
    region = string
    database_version = string
    settings = object({tier = string})
}