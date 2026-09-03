module "vpc" {
  source       = "./modules/vpc"
  network_name = "${var.environment}-vpc"
  subnet_name  = "${var.environment}-subnet"
  region       = var.region
  subnet_cidr  = "10.0.0.0/20"
  router_name  = "${var.environment}-router"
  nat_name     = "${var.environment}-nat"
}

