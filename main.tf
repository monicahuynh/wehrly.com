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

resource "aws_s3_object" "wedding_index" {
  bucket = module.wedding-site.bucket_id
  key    = "index.html"
  source = "wedding/index.html"

  content_type = "text/html"

  etag = filemd5("wedding/index.html")
}
