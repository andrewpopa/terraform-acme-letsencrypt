terraform {
  required_version = ">= 0.13.5"
  required_providers {
    acme = {
      source  = "terraform-providers/acme"
      version = ">= 1.5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 2.2.0"
    }
  }
}