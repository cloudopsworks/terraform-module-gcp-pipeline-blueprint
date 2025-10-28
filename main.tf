##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

data "google_service_account" "preview_publisher_sa" {
  count      = var.service_accounts.project_id == "" ? 1 : 0
  account_id = var.service_accounts.preview_publisher
}

data "google_service_account" "terraform_sa" {
  count      = var.service_accounts.project_id == "" ? 1 : 0
  account_id = var.service_accounts.terraform
}

data "google_service_account" "build_publisher_sa" {
  count      = var.service_accounts.build_publisher == "" ? 1 : 0
  account_id = var.service_accounts.build_publisher
}

module "blueprint" {
  source           = "git::https://github.com/cloudopsworks/terraform-module-gcp-iam-sa-roles.git//?ref=v0.1.0-alpha.4"
  is_hub           = var.is_hub
  spoke_def        = var.spoke_def
  org              = var.org
  extra_tags       = var.extra_tags
  roles            = local.roles
  service_accounts = local.service_accounts
}