##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Establish this is a HUB or spoke configuration
variable "is_hub" {
  description = "Is this a hub or spoke configuration?"
  type        = bool
  # is_hub: false                     # (Optional) Is this a hub or spoke configuration? Default is false.
  default     = false
}

variable "spoke_def" {
  description = "Spoke ID Number, must be a 3 digit number"
  type        = string
  # spoke_def: "001"                  # (Optional) Spoke ID Number, must be a 3 digit number. Default is "001".
  default     = "001"
  validation {
    condition     = (length(var.spoke_def) == 3) && tonumber(var.spoke_def) != null
    error_message = "The spoke_def must be a 3 digit number as string."
  }
}

variable "org" {
  description = "Organization details"
  type = object({
    organization_name = string
    organization_unit = string
    environment_type  = string
    environment_name  = string
  })
  # org:
  #   organization_name: "myorg"      # (Required) The name of the organization.
  #   organization_unit: "myou"       # (Required) The name of the organization unit.
  #   environment_type: "dev"         # (Required) The type of the environment (e.g., dev, prod).
  #   environment_name: "myenv"       # (Required) The name of the environment.
}

variable "extra_tags" {
  description = "Extra tags to add to the resources"
  type        = map(string)
  # extra_tags: {}                    # (Optional) Extra tags to add to the resources.
  default     = {}
}
