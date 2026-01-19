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
  # service_accounts:
  #   project_id: ""                   # (Optional) The project id where the service accounts are located. Default is the current project.
  #   preview_publisher: "gke-preview-publisher" # (Optional) The name of the preview publisher service account.
  #   terraform: "terraform-access"    # (Optional) The name of the terraform service account.
  #   build_publisher: "build-publisher" # (Optional) The name of the build publisher service account.
  default = {}
}

variable "appengine" {
  description = "Google App Engine configuration"
  type = object({
    enabled = optional(bool, false)
  })
  # appengine:
  #   enabled: false                   # (Optional) Enable App Engine configuration.
  default = {}
}

variable "cloudrun" {
  description = "Google Cloud Run configuration"
  type = object({
    enabled = optional(bool, false)
  })
  # cloudrun:
  #   enabled: false                   # (Optional) Enable Cloud Run configuration.
  default = {}
}

variable "gke" {
  description = "Google GKE configuration"
  type = object({
    enabled = optional(bool, false)
  })
  # gke:
  #   enabled: false                   # (Optional) Enable GKE configuration.
  default = {}
}

variable "firebase_test_lab" {
  description = "Google Firebase Test Lab configuration"
  type = object({
    enabled = optional(bool, false)
  })
  # firebase_test_lab:
  #   enabled: false                   # (Optional) Enable Firebase Test Lab configuration.
  default = {}
}

variable "firebase_test_lab_bucket_name" {
  description = "The name of the Firebase Test Lab bucket"
  type        = string
  # firebase_test_lab_bucket_name: "" # (Optional) The name of the Firebase Test Lab bucket.
  default = ""
}