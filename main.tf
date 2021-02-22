resource "aws_cloudfront_distribution" "this" {
  count = var.create_distribution ? 1 : 0

  aliases             = var.aliases
  comment             = var.comment
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  http_version        = var.http_version
  price_class         = var.price_class
  web_acl_id          = var.web_acl_id
  retain_on_delete    = var.retain_on_delete
  wait_for_deployment = var.wait_for_deployment

  dynamic "logging_config" {
    for_each = length(keys(var.logging_config)) == 0 ? [] : [var.logging_config]

    content {
      bucket          = logging_config.value["bucket"]
      prefix          = lookup(logging_config.value, "prefix", null)
      include_cookies = lookup(logging_config.value, "include_cookies", null)
    }
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_response
    content {
      error_caching_min_ttl = lookup(custom_error_response.value, "error_caching_min_ttl", null)
      error_code            = lookup(custom_error_response.value, "error_code")
      response_code         = lookup(custom_error_response.value, "response_code", null)
      response_page_path    = lookup(custom_error_response.value, "response_page_path", null)
    }
  }

  dynamic "default_cache_behavior" {
    for_each = length(keys(var.default_cache_behavior)) == 0 ? [] : [var.default_cache_behavior]
    content {
      allowed_methods           = lookup(default_cache_behavior.value, "allowed_methods")
      cached_methods            = lookup(default_cache_behavior.value, "allowed_methods")
      cache_policy_id           = lookup(default_cache_behavior.value, "cache_policy_id", null)
      compress                  = lookup(default_cache_behavior.value, "compress", false)
      default_ttl               = lookup(default_cache_behavior.value, "default_ttl", null)
      field_level_encryption_id = lookup(default_cache_behavior.value, "field_level_encryption_id", null)

      dynamic "forwarded_values" {
        for_each = length(keys(lookup(default_cache_behavior.value, "forwarded_values", {}))) == 0 ? [] : [lookup(default_cache_behavior.value, "forwarded_values", {})]
        content {
          headers                 = lookup(forwarded_values.value, "headers", "*")
          query_string            = lookup(forwarded_values.value, "query_string")
          query_string_cache_keys = lookup(forwarded_values.value, "query_string_cache_keys", null)

          dynamic "cookies" {
            for_each = length(keys(lookup(forwarded_values.value, "cookies", {}))) == 0 ? [] : [lookup(forwarded_values.value, "cookies", {})]
            content {
              forward           = lookup(cookies.value, "forward")
              whitelisted_names = lookup(cookies.value, "whitelisted_names", null)
            }
          }

        }
      }
      # lambda_function_association
      max_ttl                  = lookup(default_cache_behavior.value, "max_ttl", null)
      min_ttl                  = lookup(default_cache_behavior.value, "min_ttl", null)
      origin_request_policy_id = lookup(default_cache_behavior.value, "origin_request_policy_id", null)
      realtime_log_config_arn  = lookup(default_cache_behavior.value, "realtime_log_config_arn", null)
      smooth_streaming         = lookup(default_cache_behavior.value, "smooth_streaming", null)
      target_origin_id         = lookup(default_cache_behavior.value, "target_origin_id")
      trusted_signers          = lookup(default_cache_behavior.value, "trusted_signers")
      viewer_protocol_policy   = lookup(default_cache_behavior.value, "viewer_protocol_policy", "redirect-to-https")

    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = length(keys(var.ordered_cache_behavior)) == 0 ? [] : [var.ordered_cache_behavior]
    content {
      allowed_methods           = lookup(ordered_cache_behavior.value, "allowed_methods")
      cached_methods            = lookup(ordered_cache_behavior.value, "allowed_methods")
      cache_policy_id           = lookup(ordered_cache_behavior.value, "cache_policy_id", null)
      compress                  = lookup(ordered_cache_behavior.value, "compress", false)
      default_ttl               = lookup(ordered_cache_behavior.value, "default_ttl", null)
      field_level_encryption_id = lookup(ordered_cache_behavior.value, "field_level_encryption_id", null)

      dynamic "forwarded_values" {
        for_each = length(keys(lookup(ordered_cache_behavior.value, "forwarded_values", {}))) == 0 ? [] : [lookup(ordered_cache_behavior.value, "forwarded_values", {})]
        content {
          headers                 = lookup(forwarded_values.value, "headers", "*")
          query_string            = lookup(forwarded_values.value, "query_string")
          query_string_cache_keys = lookup(forwarded_values.value, "query_string_cache_keys", null)

          dynamic "cookies" {
            for_each = length(keys(lookup(forwarded_values.value, "cookies", {}))) == 0 ? [] : [lookup(forwarded_values.value, "cookies", {})]
            content {
              forward           = lookup(cookies.value, "forward")
              whitelisted_names = lookup(cookies.value, "whitelisted_names", null)
            }
          }

        }
      }
      # lambda_function_association
      max_ttl                  = lookup(ordered_cache_behavior.value, "max_ttl", null)
      min_ttl                  = lookup(ordered_cache_behavior.value, "min_ttl", null)
      origin_request_policy_id = lookup(ordered_cache_behavior.value, "origin_request_policy_id", null)
      path_pattern             = lookup(ordered_cache_behavior.value, "path_pattern")
      realtime_log_config_arn  = lookup(ordered_cache_behavior.value, "realtime_log_config_arn", null)
      smooth_streaming         = lookup(ordered_cache_behavior.value, "smooth_streaming", null)
      target_origin_id         = lookup(ordered_cache_behavior.value, "target_origin_id")
      trusted_signers          = lookup(ordered_cache_behavior.value, "trusted_signers")
      viewer_protocol_policy   = lookup(ordered_cache_behavior.value, "viewer_protocol_policy", "redirect-to-https")

    }
  }

  dynamic "origin" {
    for_each = var.origin
    content {
      domain_name = lookup(origin.value, "domain_name")
      origin_id   = lookup(origin.value, "origin_id")
      origin_path = lookup(origin.value, "origin_path", null)

      dynamic "s3_origin_config" {
        for_each = length(keys(lookup(origin.value, "s3_origin_config", {}))) == 0 ? [] : [lookup(origin.value, "s3_origin_config", {})]
        content {
          origin_access_identity = lookup(s3_origin_config.value, "cloudfront_access_identity_path", lookup(lookup(aws_cloudfront_origin_access_identity.this, lookup(s3_origin_config.value, "origin_access_identity", ""), {}), "cloudfront_access_identity_path", null))
        }
      }
      dynamic "custom_origin_config" {
        for_each = length(lookup(origin.value, "custom_origin_config", "")) == 0 ? [] : [lookup(origin.value, "custom_origin_config", "")]
        content {
          http_port                = custom_origin_config.value.http_port
          https_port               = custom_origin_config.value.https_port
          origin_protocol_policy   = custom_origin_config.value.origin_protocol_policy
          origin_ssl_protocols     = custom_origin_config.value.origin_ssl_protocols
          origin_keepalive_timeout = lookup(custom_origin_config.value, "origin_keepalive_timeout", null)
          origin_read_timeout      = lookup(custom_origin_config.value, "origin_read_timeout", null)
        }
      }

      dynamic "custom_header" {
        for_each = lookup(origin.value, "custom_header", [])
        content {
          name  = custom_header.value.name
          value = custom_header.value.value
        }
      }

    }
  }

  dynamic "origin_group" {
    for_each = var.origin_group

    content {
      origin_id = lookup(origin_group.value, "origin_id", origin_group.key)

      failover_criteria {
        status_codes = origin_group.value["failover_status_codes"]
      }

      member {
        origin_id = origin_group.value["primary_member_origin_id"]
      }

      member {
        origin_id = origin_group.value["secondary_member_origin_id"]
      }
    }
  }

  restrictions {
    dynamic "geo_restriction" {
      for_each = [var.geo_restriction]

      content {
        restriction_type = lookup(geo_restriction.value, "restriction_type", "none")
        locations        = lookup(geo_restriction.value, "locations", [])
      }
    }
  }

  viewer_certificate {
    acm_certificate_arn            = lookup(var.viewer_certificate, "acm_certificate_arn", null)
    cloudfront_default_certificate = lookup(var.viewer_certificate, "cloudfront_default_certificate", null)
    iam_certificate_id             = lookup(var.viewer_certificate, "iam_certificate_id", null)

    minimum_protocol_version = lookup(var.viewer_certificate, "minimum_protocol_version", "TLSv1.2") # #tfsec:ignore:AWS021
    ssl_support_method       = lookup(var.viewer_certificate, "ssl_support_method", null)
  }

  tags = var.tags
}
