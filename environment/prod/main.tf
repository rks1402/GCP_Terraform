locals {
  env = "prod"
}

provider "google" {
  project = "${var.project}"
  region = "${var.region}"
}

module "vpc" {
  source  = "../../modules/vpc"
  project = "${var.project}"
  env     = "${local.env}"
}

module "database" {
  source  = "../../modules/database"
  project = "${var.project}"
}

module "database-instance" {
  source  = "../../modules/database-instance"
  project = "${var.project}"
}

module "users" {
  source  = "../../modules/users"
  project = "${var.project}"
}

module "firewall" {
  source  = "../../modules/firewall"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}
