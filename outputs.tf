output "domain_to_cert" {
  value = zipmap(acme_certificate.certificate.*.certificate_domain, acme_certificate.certificate.*.certificate_pem)
}

output "domain_to_key" {
  value = zipmap(acme_certificate.certificate.*.certificate_domain, acme_certificate.certificate.*.private_key_pem)
}

output "domain_to_ip" {
  value = length(acme_certificate.certificate.*.certificate_domain) > 0 ? zipmap(acme_certificate.certificate.*.certificate_domain, values(var.records)) : {}
}

output "ip_to_domain" {
  value = length(acme_certificate.certificate.*.certificate_domain) > 0 ? zipmap(values(var.records), acme_certificate.certificate.*.certificate_domain) : {}
}

output "ip_to_cert" {
  value = length(acme_certificate.certificate.*.certificate_pem) > 0 ? zipmap(values(var.records), acme_certificate.certificate.*.certificate_pem) : {}
}

output "ip_to_intermediate" {
  value = length(acme_certificate.certificate.*.issuer_pem) > 0 ? zipmap(values(var.records), acme_certificate.certificate.*.issuer_pem) : {}
}

output "ip_to_pem" {
  value = length(acme_certificate.certificate.*.private_key_pem) > 0 ? zipmap(values(var.records), acme_certificate.certificate.*.private_key_pem) : {}
}

output "private_key_pem" {
  value = acme_certificate.certificate.*.private_key_pem
}

output "certificate_domain" {
  value = acme_certificate.certificate.*.certificate_domain
}

output "certificate_pem" {
  value = acme_certificate.certificate.*.certificate_pem
}

output "issuer_pem" {
  value = acme_certificate.certificate.*.issuer_pem
}
