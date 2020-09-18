terraform {
  required_providers {
    acme = {
      source = "terraform-providers/acme"
    }
    dnsimple = {
      source = "terraform-providers/dnsimple"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
  required_version = ">= 0.13"
}
