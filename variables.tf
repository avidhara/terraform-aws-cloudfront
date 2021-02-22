variable "create_distribution" {
  type        = bool
  description = "(Optional) Do you want to create Cloudfront Distribution"
  default     = true
}

variable "aliases" {
  type        = list(string)
  description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
  default = [

  ]
}

variable "comment" {
  type        = string
  description = "(Optional) - Any comments you want to include about the distribution."
  default     = ""
}

variable "enabled" {
  type        = bool
  description = "(Required) - Whether the distribution is enabled to accept end user requests for content."
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "(Optional) - Whether the IPv6 is enabled for the distribution."
  default     = false
}

variable "http_version" {
  type        = string
  description = "(Optional) - The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
  default     = "http2"
}

variable "variable_name" {
  description = "description"
  default     = "default"
}

variable "logging_config" {
  type        = map(string)
  description = "(Optional) - The logging configuration that controls how logs are written to your distribution (maximum one)."
  default = {

  }
}


variable "custom_error_response" {
  type        = any
  description = "(Optional) - One or more custom error response elements (multiples allowed)."
  default = [

  ]
}

variable "default_cache_behavior" {
  type        = any
  description = "(Required) - The default cache behavior for this distribution (maximum one)."
}

variable "ordered_cache_behavior" {
  type        = any
  description = "(Optional) - An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
  default = [

  ]
}

variable "origin" {
  type        = any
  description = "(Required) - One or more origins for this distribution (multiples allowed)."
}

variable "origin_group" {
  type        = any
  description = "(Optional) - One or more origin_group for this distribution (multiples allowed)."
  default = [

  ]
}

variable "price_class" {
  type        = string
  description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  default     = "PriceClass_100"
}

variable "geo_restriction" {
  type        = any
  description = "(Required) - The restriction configuration for this distribution (maximum one)."
  default = {

  }
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default = {

  }
}

variable "viewer_certificate" {
  type        = map(string)
  description = "(Required) - The SSL configuration for this distribution (maximum one)."
  default = {
    minimum_protocol_version = "TLSv1.2"
  }
}

variable "web_acl_id" {
  type        = string
  description = "Optional) - A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution."
  default     = null
}

variable "retain_on_delete" {
  type        = bool
  description = "(Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. Default: false."
  default     = false
}

variable "wait_for_deployment" {
  type        = bool
  description = "(Optional) - If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process. Default: true."
  default     = true
}
