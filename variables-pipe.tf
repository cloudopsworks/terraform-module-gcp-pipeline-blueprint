##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "service_accounts" {
  description = "A map of Service accounts for various IAM users"
  type = object({
    project_id        = optional(string, "")
    preview_publisher = optional(string, "gke-preview-publisher")
    terraform         = optional(string, "terraform-access")
    build_publisher   = optional(string, "build-publisher")
  })
  default = {}
}
