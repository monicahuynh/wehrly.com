variable "domain" {
    default = "wehrly.com"
    type = string
}

provider "aws" {
  region = "us-east-1"
}

module "cdn" {
  # source = "cloudposse/cloudfront-s3-cdn/aws"
  source = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=0.82.4"
  # Cloud Posse recommends pinning every module to a specific version
  # version = "x.x.x"

  # namespace         = "eg"
  stage             = "prod"
  name              = "app"
  # aliases           = ["assets.cloudposse.com"]
  dns_alias_enabled = true
  parent_zone_name  = var.domain

  #deployment_principal_arns = {
    #"arn:aws:iam::123456789012:role/principal1" = ["prefix1/", "prefix2/"]
    #"arn:aws:iam::123456789012:role/principal2" = [""]
  #}
}