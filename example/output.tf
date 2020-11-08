output "certificate_domain" {
  value = module.acme.certificate_domain
}

output "certificate_pem" {
  value = module.acme.certificate_pem
}

output "fullchain_pem" {
  value = module.acme.fullchain_pem
}

output "issuer_pem" {
  value = module.acme.issuer_pem
}

output "private_key" {
  value = module.acme.private_key
}