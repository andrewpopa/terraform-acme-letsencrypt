provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_requestor
}

resource "acme_certificate" "certificate" {
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = var.domain

  dns_challenge {
    provider = var.dns_provider
    config   = var.dns_config
  }
}

locals {
  certificate_bundle = <<EOT
    ${acme_certificate.certificate.certificate_pem}
    ${acme_certificate.certificate.issuer_pem}
  EOT
}

resource "local_file" "certificate_bundle" {
  sensitive_content = local.certificate_bundle
  filename          = "./certificate_bundle.pem"
}

resource "local_file" "private_key" {
  sensitive_content = acme_certificate.certificate.private_key_pem
  filename          = "./private_key.pem"
}

resource "local_file" "certificate_file" {
  sensitive_content = acme_certificate.certificate.certificate_pem
  filename          = "./certificatae.pem"
}