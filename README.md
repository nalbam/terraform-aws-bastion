# terraform-aws-bastion

<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator | n/a | `bool` | `true` | no |
| allow\_ip\_address | n/a | `list(string)` | `[]` | no |
| ami\_id | n/a | `string` | `""` | no |
| instance\_type | n/a | `string` | `"t2.micro"` | no |
| key\_name | n/a | `string` | `""` | no |
| key\_path | n/a | `string` | `""` | no |
| name | Name of the cluster, e.g: demo | `any` | n/a | yes |
| subnet\_id | n/a | `string` | `""` | no |
| user\_data | n/a | `string` | `""` | no |
| volume\_size | n/a | `string` | `"8"` | no |
| volume\_type | n/a | `string` | `"gp2"` | no |
| vpc\_id | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| key\_name | n/a |
| private\_ip | n/a |
| public\_ip | n/a |
| security\_group\_id | n/a |

<!--- END_TF_DOCS --->
