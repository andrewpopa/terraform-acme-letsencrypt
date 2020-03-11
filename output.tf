output "private_key" {
  description = "Private key"
  value       = local_file.private_key.filename
}

output "certificate_file" {
  description = "Certificate"
  value       = local_file.certificate_file.filename
}

output "certificate_bundle" {
  description = "Bundle"
  value       = local_file.certificate_bundle.filename
}