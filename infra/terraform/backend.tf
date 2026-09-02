terraform {
  backend "gcs" {
    bucket = "gke-poc-dileep-tfstate"
    prefix = "env"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}
