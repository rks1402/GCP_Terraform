terraform {
  backend "gcs" {
    bucket = "terraform-002-376320-tfstate"
    prefix = "env/prod"
  }
}