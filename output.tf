output "id" {
  description = "acme account id"
  value       = acme_registration.reg.id
}

output "certificate_domain" {
  description = "certificate domain"
  value       = acme_certificate.certificate.certificate_domain
}

output "account_key_pem" {
  description = "certificate in pem format"
  value       = acme_certificate.certificate.account_key_pem
}

output "certificate_p12" {
  description = "certificate in p12 format"
  value       = acme_certificate.certificate.certificate_p12
}

output "certificate_pem" {
  description = "certificate in pem format"
  value       = acme_certificate.certificate.certificate_pem
}

output "fullchain_pem" {
  description = "concatenated certificate with isesuer"
  value = join("", [
    acme_certificate.certificate.certificate_pem,
    acme_certificate.certificate.issuer_pem
  ])
}

output "issuer_pem" {
  description = "issuer intermidiate certificate"
  value       = acme_certificate.certificate.issuer_pem
}

output "private_key" {
  description = "acme account private key in pem format"
  value       = acme_certificate.certificate.private_key_pem
}

output "key_type" {
  description = "acme account private key in pem format"
  value       = acme_certificate.certificate.key_type
}

output "min_days_remaining" {
  description = "acme account private key in pem format"
  value       = acme_certificate.certificate.min_days_remaining
}