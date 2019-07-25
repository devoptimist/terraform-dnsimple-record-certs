variable "instance_count" {
  default = 0
}

variable "records" {
  default = {}
}

variable "contact" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "oauth_token" {
  type = string
}

variable "account" {
  type = string
}

variable "issuer_url" {
  type        = string
  # default   = "https://acme-staging-v02.api.letsencrypt.org/directory"
  default     = "https://acme-v02.api.letsencrypt.org/directory"
  description = <<EOF
The URL end point for the certificate issuer, acme-staging is the default
as the acme production one is rate limited to 50 issues per week per
domain. Switch to https://acme-v02.api.letsencrypt.org/directory
for the production end point
EOF
}
