##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  sa_preview = [
    {
      name_prefix  = "gke-preview-pub"
      display_name = "GKE Preview Publisher"
      description  = "GKE Preview Publisher Service Account"
      members = [
        {
          member = var.service_accounts.project_id == "" ? data.google_service_account.preview_publisher_sa[0].member : "serviceAccount:${var.service_accounts.preview_publisher}@${var.service_accounts.project_id}.iam.gserviceaccount.com"
          role   = "roles/iamServiceAccountUser"
        }
      ]
    },
  ]
  sa_build = [
    {
      name_prefix  = "build-publisher"
      display_name = "Build Publisher"
      description  = "Build Publisher Service Account"
      members = [
        {
          member = var.service_accounts.project_id == "" ? data.google_service_account.build_publisher_sa[0].member : "serviceAccount:${var.service_accounts.build_publisher}@${var.service_accounts.project_id}.iam.gserviceaccount.com"
          role   = "roles/iamServiceAccountUser"
        }
      ]
    }
  ]
  service_accounts = concat(local.sa_preview, local.sa_build)
}