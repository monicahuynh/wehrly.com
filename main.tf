module "www-site" {
  source = "./modules/s3-site"
  domain = "www.wehrly.com"
}