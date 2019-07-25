# Overview
This terraform module will use the dnsimple provider to create a dns
record. It will also use the acme provider to create certificates for all
the records created
## Usage

```hcl

module "chef_server" {
  source                      = "devoptimist/record-cert/dnsimple"
  version                     = "0.1.0"
  records                     = {"my-web-server" = "3.8.143.249"}
  contact                     = "myname@mycompany.com"
  domain_name                 = "mycompany.com"
  oauth_token                 = "MYDNSIMPLEOAUTHTOKEN"
  account                     = "17272"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|records|A map of desiered dns hostname and public ip address|map|{}|no|
|contact|The email address to use for cert creation|string||yes|
|domain_name|The domain name to use for the records and the certs|string||yes|
|oauth_token|The account token for your dnsimple account|string||yes|
|account|The dnsimple account name (normally a 6 digit number)|string||yes|

## Map Variable examples

### records

```hcl
"records" = {
  "my-web-server" = "3.7.122.138"
  }
}
```

## Outputs
| Name | Description | Type |
|------|-------------|------|
|fqdn_to_cert|A map of fqdn names to certificates |map|
|fqdn_to_key|A map of fqdn names to private key pems|map|
|private_key_pem|A list of private key pems|list|
|certificate_domain|A list of fqdns that where created|list|
|certificate_pem|A list of certificates pems|list|


