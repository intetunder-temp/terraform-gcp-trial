terraform {
  backend "gcs" {
    bucket = "sander-terraform-state"
    prefix = "gcp"
  }
}

provider "google-beta" {
  version = "~> 2.20.0"
}
provider "google" {
  version = "~> 2.20.0"
}

