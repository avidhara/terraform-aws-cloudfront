# Terraform Module for AWS Cloudwatch
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_cloudfront_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.0/docs/resources/cloudfront_distribution) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aliases | (Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution. | `list(string)` | `[]` | no |
| comment | (Optional) - Any comments you want to include about the distribution. | `string` | `""` | no |
| create\_distribution | (Optional) Do you want to create Cloudfront Distribution | `bool` | `true` | no |
| custom\_error\_response | (Optional) - One or more custom error response elements (multiples allowed). | `any` | `[]` | no |
| default\_cache\_behavior | (Required) - The default cache behavior for this distribution (maximum one). | `any` | n/a | yes |
| enabled | (Required) - Whether the distribution is enabled to accept end user requests for content. | `bool` | n/a | yes |
| geo\_restriction | (Required) - The restriction configuration for this distribution (maximum one). | `any` | `{}` | no |
| http\_version | (Optional) - The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2. | `string` | `"http2"` | no |
| is\_ipv6\_enabled | (Optional) - Whether the IPv6 is enabled for the distribution. | `bool` | `false` | no |
| logging\_config | (Optional) - The logging configuration that controls how logs are written to your distribution (maximum one). | `map(string)` | `{}` | no |
| ordered\_cache\_behavior | (Optional) - An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0. | `any` | `[]` | no |
| origin | (Required) - One or more origins for this distribution (multiples allowed). | `any` | n/a | yes |
| origin\_group | (Optional) - One or more origin\_group for this distribution (multiples allowed). | `any` | `[]` | no |
| price\_class | (Optional) - The price class for this distribution. One of PriceClass\_All, PriceClass\_200, PriceClass\_100 | `string` | `"PriceClass_100"` | no |
| retain\_on\_delete | (Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. Default: false. | `bool` | `false` | no |
| tags | (Optional) A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| variable\_name | description | `string` | `"default"` | no |
| viewer\_certificate | (Required) - The SSL configuration for this distribution (maximum one). | `map(string)` | <pre>{<br>  "minimum_protocol_version": "TLSv1.2"<br>}</pre> | no |
| wait\_for\_deployment | (Optional) - If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process. Default: true. | `bool` | `true` | no |
| web\_acl\_id | Optional) - A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution. | `string` | `null` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
