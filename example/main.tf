module "acme" {
  source          = "../"
  email_requestor = "EMAIL.REQUESTOR@DOMAIN.COM"
  domain          = "YOUR-DOMAIN"
  dns_config = {
    CLOUDFLARE_EMAIL          = "CLOUDFLARE-EMAIL"
    CLOUDFLARE_API_KEY        = "CLOUDFLARE-API-KEY"
    CLOUDFLARE_ZONE_API_TOKEN = "CLOUDFLARE-API-TOKEN"
  }
}