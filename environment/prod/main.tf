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
  subnet  = "${module.vpc.subnet}"
}

module "database-instance" {
  source  = "../../modules/database-instance"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}

module "users" {
  source  = "../../modules/users"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}

module "firewall" {
  source  = "../../modules/firewall"
  project = "${var.project}"
  subnet  = "${module.vpc.subnet}"
}
