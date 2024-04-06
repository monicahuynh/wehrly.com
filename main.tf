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

/*
resource "aws_s3_object" "wedding_index" {
  bucket = module.wedding-site.bucket_id
  key    = "index.html"
  source = "wedding/index.html"

  content_type = "text/html"

  etag = filemd5("wedding/index.html")
}
*/

module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${path.module}/wedding"
  template_vars = {
    # Pass in any values that you wish to use in your templates.
  }
}

resource "aws_s3_object" "static_files" {
  for_each = module.template_files.files

  bucket       = module.wedding-site.bucket_id
  key          = each.key
  content_type = each.value.content_type

  # The template_files module guarantees that only one of these two attributes
  # will be set for each file, depending on whether it is an in-memory template
  # rendering result or a static file on disk.
  source  = each.value.source_path
  content = each.value.content

  # Unless the bucket has encryption enabled, the ETag of each object is an
  # MD5 hash of that object.
  etag = each.value.digests.md5
}
