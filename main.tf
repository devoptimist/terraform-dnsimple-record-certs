locals {
  rec_count = var.instance_count # length(keys(var.records))
}

provider "acme" {
  server_url = var.issuer_url
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.contact
}

resource "acme_certificate" "certificate" {
  count           = local.rec_count
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = "${element(keys(var.records), count.index)}.${var.domain_name}"

  dns_challenge {
    provider = "dnsimple"
    config = {
      DNSIMPLE_OAUTH_TOKEN = var.oauth_token
    }
  }
}

provider "dnsimple" {
  token   = var.oauth_token
  account = var.account
}

resource "dnsimple_record" "create_a" {
  count  = local.rec_count

  domain = var.domain_name
  name   = length(var.records) > 0 ? element(keys(var.records), count.index) : ""
  value  = length(var.records) > 0 ? lookup(var.records, element(keys(var.records), count.index)) : ""
  type   = "A"
  ttl    = 60
}
