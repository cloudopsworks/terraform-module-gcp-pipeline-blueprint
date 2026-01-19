## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.9.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_blueprint"></a> [blueprint](#module\_blueprint) | git::https://github.com/cloudopsworks/terraform-module-gcp-iam-sa-roles.git// | v1.0.0 |
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_service_account.build_publisher_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |
| [google_service_account.preview_publisher_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |
| [google_service_account.terraform_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appengine"></a> [appengine](#input\_appengine) | Google App Engine configuration | <pre>object({<br/>    enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_cloudrun"></a> [cloudrun](#input\_cloudrun) | Google Cloud Run configuration | <pre>object({<br/>    enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_firebase_test_lab"></a> [firebase\_test\_lab](#input\_firebase\_test\_lab) | Google Firebase Test Lab configuration | <pre>object({<br/>    enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_firebase_test_lab_bucket_name"></a> [firebase\_test\_lab\_bucket\_name](#input\_firebase\_test\_lab\_bucket\_name) | The name of the Firebase Test Lab bucket | `string` | `""` | no |
| <a name="input_gke"></a> [gke](#input\_gke) | Google GKE configuration | <pre>object({<br/>    enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | A map of Service accounts for various IAM users | <pre>object({<br/>    project_id        = optional(string, "")<br/>    preview_publisher = optional(string, "gke-preview-publisher")<br/>    terraform         = optional(string, "terraform-access")<br/>    build_publisher   = optional(string, "build-publisher")<br/>  })</pre> | `{}` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | n/a |
