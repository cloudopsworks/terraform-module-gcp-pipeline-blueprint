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
  roles = concat(local.role_appengine)
}