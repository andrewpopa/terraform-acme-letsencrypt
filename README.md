# terraform-acme-letsencrypt
Terraform module to automatically provision certificates using acme and letsencrypt

# Terraform version
This module was written using terraform version `0.13`

# Assumptions
- You need dynamically to provision certificates in your environment using [ACME](https://tools.ietf.org/html/rfc8555) TLS certificates using DNS challenges

# How to consume
please use [example](https://github.com/andrewpopa/terraform-acme-letsencrypt/tree/master/example) folder to see the examples of consumption 

```bash
module "acme" {
  source          = "../"
  acme_provider = "https://acme-v02.api.letsencrypt.org/directory"
  email_address = "andrew.popa@gmail.com"
  common_name = "<domain>"
  dns_provider = "<provider>"
  dns_config = {
    CLOUDFLARE_EMAIL          = "<email>"
    CLOUDFLARE_API_KEY        = "<api-key>"
    CLOUDFLARE_ZONE_API_TOKEN = "<zone-api-token>"
  }
}
```

# Inputs
| **Name**  | **Type** | **Default** | **Required** | **Description** |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| acme_provider | string |  | yes | acme provider |
| email_address | string |  | yes | email for acme registration |
| common_name | string |  | yes | domain name certificate is created for |
| dns_provider | string |  | yes | dns provider for validate | 
| dns_config | map |  | yes | dns provider configuration |

# Outputs
| **Name**  | **Type** | **Description** |
| ------------- | ------------- | ------------- |
| id | string | Security group ID |
| certificate_domain | string | certificate domain |
| certificate_p12 | string | certificate in p12 format |
| certificate_pem | string | certificate in pem format |
| fullchain_pem | string | certificate with intermediate certificate concatenated |
| issuer_pem | string | issuer intermidiate certificate |
| private_key | string | private key in pem format |
| key_type | string | key type |
| min_days_remaining | string | certificate days |