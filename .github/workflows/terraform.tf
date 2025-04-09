# terraform.tf
terraform {
  required_providers {
    oci = {
    source = "hashicorp/oci"
    version = ">= 5.0.0"
    }
  }
}

terraform {
  backend "http" {
  address = "______________"
  updated_method = "PUT"
  }
}

