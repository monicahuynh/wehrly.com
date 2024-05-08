provider "aws" {
  region = "us-east-1"
}

module "www-site" {
  source = "./modules/s3-site"
  domain = "www.wehrly.com"
}

module "eric-site" {
  source = "./modules/s3-site"
  domain = "eric.wehrly.com"

  filedir = "${path.module}/eric"
}

module "wedding-site" {
  source = "./modules/s3-site"
  domain = "huynh.wehrly.com"

  filedir = "${path.module}/wedding"
}
