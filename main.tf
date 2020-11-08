// acme provider
provider "acme" {
  server_url = var.acme_provider
}

// account
resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.key.private_key_pem
  email_address   = var.email_address
}

// certificate
resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.common_name

  dns_challenge {
    provider = var.dns_provider
    config = var.dns_config
  }
}

// local files
resource "local_file" "certificate" {
  content = acme_certificate.certificate.certificate_pem
  filename = "./certificate.pem"
}

resource "local_file" "fullchain" {
  content = join("", [
    acme_certificate.certificate.certificate_pem,
    acme_certificate.certificate.issuer_pem
  ])
  filename = "./fullchain.pem"
}

resource "local_file" "issuer" {
  content = acme_certificate.certificate.issuer_pem
  filename = "./chain.pem"
}

resource "local_file" "private_key" {
  content = acme_certificate.certificate.private_key_pem
  filename = "./private_key.pem"
}

resource "local_file" "certificate_p12" {
  content = acme_certificate.certificate.certificate_p12
  filename = "./certificate.p12"
}