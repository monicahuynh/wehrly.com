module "www-site" {
  source = "./modules/s3-site"
  domain = "www.wehrly.com"
}

module "eric-site" {
  source = "./modules/s3-site"
  domain = "eric.wehrly.com"
}

module "wedding-site" {
  source = "./modules/s3-site"
  domain = "wedding.wehrly.com"
}
