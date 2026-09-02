module "vpc" {
  source       = "./modules/vpc"
  network_name = "gke-poc-dev-vpc"
  subnet_name  = "gke-poc-dev-subnet"
  region       = var.region
  subnet_cidr  = "10.0.0.0/20"
  router_name  = "gke-poc-dev-router"
  nat_name     = "gke-poc-dev-nat"
}

