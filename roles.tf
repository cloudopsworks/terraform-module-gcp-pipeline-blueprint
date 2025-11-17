##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  role_appengine = var.appengine.enabled ? [
    {
      name_prefix = "appengine-deployer"
      title       = "App Engine Deployer"
      description = "Role to deploy App Engine applications"
      permissions = [
        "appengine.applications.get",
        "appengine.versions.create",
        "appengine.versions.update",
        "appengine.versions.delete",
        "appengine.instances.list",
        "appengine.instances.delete",
        "appengine.services.get",
        "appengine.services.update",
      ]
    }
  ] : []
  role_cloudrun = var.cloudrun.enabled ? [
    {
      name_prefix = "cloudrun-deployer"
      title       = "Cloud Run Deployer"
      description = "Role to deploy Cloud Run services"
      permissions = [
        "run.services.create",
        "run.services.update",
        "run.services.delete",
        "run.routes.get",
        "run.routes.update",
        "run.revisions.list",
        "run.revisions.delete",
      ]
    }
  ] : []
  role_gke = var.gke.enabled ? [
    {
      name_prefix = "gke-deployer"
      title       = "GKE Deployer"
      description = "Role to deploy GKE Workloads"
      permissions = [
        "container.clusters.get",
        "container.clusters.list",
        "container.workloads.create",
        "container.workloads.update",
        "container.workloads.delete",
        "container.pods.get",
        "container.pods.list",
      ]
    }
  ] : []
  role_preview = []
  roles        = concat(local.role_appengine, local.role_cloudrun, local.role_gke, local.role_preview)
}