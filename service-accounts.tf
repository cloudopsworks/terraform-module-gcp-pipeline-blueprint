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
          role   = "roles/iam.serviceAccountTokenCreator"
        }
      ]
      roles = [
        {
          role = "projects/${var.service_accounts.project_id == "" ? data.google_project.current.project_id : var.service_accounts.project_id}/roles/${replace(var.service_accounts.preview_publisher, "-", "_")}"
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
          role   = "roles/iam.serviceAccountTokenCreator"
        }
      ]
      roles = [
        {
          role = "projects/${var.service_accounts.project_id == "" ? data.google_project.current.project_id : var.service_accounts.project_id}/roles/${replace(var.service_accounts.build_publisher, "-", "_")}"
        }
      ]
    }
  ]
  sa_appengine = var.appengine.enabled ? [
    {
      name_prefix  = "appengine-deployer"
      env_suffix   = true
      display_name = "App Engine Deployer"
      description  = "App Engine Deployer Service Account"
      members = [
        {
          member = var.service_accounts.project_id == "" ? data.google_service_account.terraform_sa[0].member : "serviceAccount:${var.service_accounts.terraform}@${var.service_accounts.project_id}.iam.gserviceaccount.com"
          role   = "roles/iam.serviceAccountTokenCreator"
        }
      ]
      roles = [
        {
          ref = "appengine-deployer"
        },
        {
          role = "roles/iam.serviceAccountAdmin"
        },
        {
          role = "roles/storage.admin"
        },
        {
          role = "roles/resourcemanager.folderViewer"
        }
      ]
    }
  ] : []
  sa_cloudrun = var.cloudrun.enabled ? [
    {
      name_prefix  = "cloudrun-deployer"
      env_suffix   = true
      display_name = "Cloud Run Deployer"
      description  = "Cloud Run Deployer Service Account"
      members = [
        {
          member = var.service_accounts.project_id == "" ? data.google_service_account.terraform_sa[0].member : "serviceAccount:${var.service_accounts.terraform}@${var.service_accounts.project_id}.iam.gserviceaccount.com"
          role   = "roles/iam.serviceAccountTokenCreator"
        }
      ]
      roles = [
        {
          ref = "cloudrun-deployer"
        },
        {
          role = "roles/iam.serviceAccountAdmin"
        },
        {
          role  = " "
        }
      ]
    }
  ] : []
  sa_gke = var.gke.enabled ? [
    {
      name_prefix  = "gke-deployer"
      env_suffix   = true
      display_name = "GKE Deployer"
      description  = "GKE Deployer Service Account"
      members = [
        {
          member = var.service_accounts.project_id == "" ? data.google_service_account.terraform_sa[0].member : "serviceAccount:${var.service_accounts.terraform}@${var.service_accounts.project_id}.iam.gserviceaccount.com"
          role   = "roles/iam.serviceAccountTokenCreator"
        }
      ]
      roles = [
        {
          ref = "gke-deployer"
        }
      ]
    }
  ] : []

  service_accounts = concat(local.sa_preview, local.sa_build, local.sa_appengine, local.sa_cloudrun, local.sa_gke)
}