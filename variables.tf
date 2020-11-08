variable "acme_provider" {
  type = string
  description = "acme provider"
}

variable "email_address" {
  description = "email for acme registration"
  type        = string
}

variable "common_name" {
  description = "The common name to use for the certificate."
  type        = string
}

variable "dns_provider" {
  description = "dns provider for validate"
  type        = string
}

variable "dns_config" {
  type = map(string)
  description = "dns provider configuration"
}