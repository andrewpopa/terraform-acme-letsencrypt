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