variable "domain" {
  description = "Domain name for certificate"
  type        = string
  default     = ""
}

variable "dns_provider" {
  description = "DNS provider"
  type        = string
  default     = "cloudflare"
}

variable "dns_config" {
  description = "DNS provider config"
  type        = map
}

variable "email_requestor" {
  description = "Email address of requestor"
  type        = string
  default     = ""
}