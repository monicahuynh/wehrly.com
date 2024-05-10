module "template_files" {
    # count = var.filedir != "" ? 1 : 0

  source = "hashicorp/dir/template"

  base_dir = "${var.filedir}"
  
  file_types = {
    # defaults 
    ".3g2": "video/3gpp2", ".3gp": "video/3gpp", ".atom": "application/atom+xml", ".css": "text/css; charset=utf-8", ".eot": "application/vnd.ms-fontobject", ".gif": "image/gif", ".htm": "text/html; charset=utf-8", ".html": "text/html; charset=utf-8", ".ico": "image/vnd.microsoft.icon", ".jar": "application/java-archive", ".jpeg": "image/jpeg", ".jpg": "image/jpeg", ".js": "application/javascript", ".json": "application/json", ".jsonld": "application/ld+json", ".otf": "font/otf", ".pdf": "application/pdf", ".png": "image/png", ".rss": "application/rss+xml", ".svg": "image/svg+xml", ".swf": "application/x-shockwave-flash", ".ttf": "font/ttf", ".txt": "text/plain; charset=utf-8", ".weba": "audio/webm", ".webm": "video/webm", ".webp": "image/webp", ".woff": "font/woff", ".woff2": "font/woff2", ".xhtml": "application/xhtml+xml", ".xml": "application/xml",
    ".mjs": "text/javascript"
  }
}

resource "aws_s3_object" "static_files" {

  for_each = module.template_files.files

  bucket       = aws_s3_bucket.site.bucket
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
