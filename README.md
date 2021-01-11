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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aliases | (Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution. | `list(string)` | `null` | no |
| cache\_behavior | The map of cache behaviors for this distribution. Key `default` will be used as the default cache behavior, all other keys will be used as ordered list of cache behaviors. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0. | `any` | `null` | no |
| comment | (Optional) - Any comments you want to include about the distribution. | `string` | `null` | no |
| create\_distribution | (Optional) - Do you want to create Cloudfront Distribution | `bool` | `true` | no |
| create\_origin\_access\_identity | (Optional) - Do you want to create Origin access identy | `bool` | `false` | no |
| custom\_error\_response | One or more custom error response elements | `any` | `{}` | no |
| default\_root\_object | (Optional) - The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | `"index.html"` | no |
| enabled | (Optional) - Whether the distribution is enabled to accept end user requests for content. | `bool` | `true` | no |
| geo\_restriction | The restriction configuration for this distribution (geo\_restrictions) | `any` | `{}` | no |
| http\_version | (Optional) - The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2. | `string` | `"http2"` | no |
| is\_ipv6\_enabled | (Optional) - Whether the IPv6 is enabled for the distribution. | `bool` | `null` | no |
| logging\_config | (Optional) - The logging configuration that controls how logs are written to your distribution (maximum one). | `any` | `{}` | no |
| origin | One or more origins for this distribution (multiples allowed). | `any` | `{}` | no |
| origin\_access\_identities | (Optional) - Map of CloudFront origin access identities (value as a comment) | `map(string)` | `{}` | no |
| origin\_group | One or more origin\_group for this distribution (multiples allowed). | `any` | `{}` | no |
| price\_class | (Optional) - The price class for this distribution. One of PriceClass\_All, PriceClass\_200, PriceClass\_100 | `string` | `"PriceClass_100"` | no |
| retain\_on\_delete | (Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. | `bool` | `false` | no |
| tags | (Optional) - A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| viewer\_certificate | The SSL configuration for this distribution | `any` | <pre>{<br>  "cloudfront_default_certificate": true,<br>  "minimum_protocol_version": "TLSv1"<br>}</pre> | no |
| wait\_for\_deployment | (Optional) - If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process. | `bool` | `true` | no |
| web\_acl\_id | (Optional) - If you're using AWS WAF to filter CloudFront requests, the Id of the AWS WAF web ACL that is associated with the distribution. The WAF Web ACL must exist in the WAF Global (CloudFront) region and the credentials configuring this argument must have waf:GetWebACL permissions assigned. If using WAFv2, provide the ARN of the web ACL. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| access\_identity\_etag | The current version of the origin access identity's information. For example: E2QWRUHAPOMQZL. |
| access\_identity\_id | The identifier for the distribution. For example: EDFDVBD632BHDS5. |
| arn | The ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID. |
| caller\_reference | Internal value used by CloudFront to allow future updates to the distribution configuration. |
| cloudfront\_access\_identity\_path | A shortcut to the full path for the origin access identity to use in CloudFront, see below. |
| domain\_name | The domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net. |
| hosted\_zone\_id | The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2. |
| iam\_arn | A pre-generated ARN for use in S3 bucket policies (see below). Example: arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E2QWRUHAPOMQZL. |
| id | The identifier for the distribution. For example: EDFDVBD632BHDS5. |
| in\_progress\_validation\_batches | The number of invalidation batches currently in progress. |
| last\_modified\_time | The date and time the distribution was last modified. |
| s3\_canonical\_user\_id | The Amazon S3 canonical user ID for the origin access identity, which you use when giving the origin access identity read permission to an object in Amazon S3. |
| status | The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system. |
| trusted\_signers | List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->