
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_default" {
  rules_v2026_06_09 {
    name      = "default"
    is_secure = true
    variable {
      name        = "PMUSER_EU"
      description = ""
      value       = "false"
      hidden      = true
      sensitive   = false
    }
    variable {
      name        = "PMUSER_LIVE_KEY"
      description = "Origin shared key"
      value       = "aengoo5coinaifee1Abee0ukoo5ohzoh"
      hidden      = false
      sensitive   = true
    }
    variable {
      name        = "PMUSER_ORIGIN"
      description = "Request Origin header"
      value       = "https://vimeo.com"
      hidden      = false
      sensitive   = false
    }
    variable {
      name        = "PMUSER_RANDOM_VARIABLE"
      description = ""
      value       = "1"
      hidden      = false
      sensitive   = false
    }
    variable {
      name        = "PMUSER_REGION"
      description = ""
      value       = ""
      hidden      = true
      sensitive   = false
    }
    variable {
      name        = "PMUSER_TA_PRIMARY_KEY"
      description = "Primary token auth key"
      value       = "5e1acff3422c5037ca4be8b80f240f57"
      hidden      = false
      sensitive   = true
    }
    custom_override {
      name        = "lalexand-AdvancedOverride"
      override_id = "cbo_688680851"
    }
    behavior {
      origin {
        cache_key_hostname               = "ORIGIN_HOSTNAME"
        compress                         = true
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", ]
        enable_true_client_ip            = false
        forward_host_header              = "ORIGIN_HOSTNAME"
        hostname                         = var.origin_hostname
        http2_enabled                    = false
        http2_title                      = ""
        http_port                        = 443
        https_port                       = 443
        ip_version                       = "IPV4"
        min_tls_version                  = "DYNAMIC"
        origin_certificate               = ""
        origin_certs_to_honor            = "STANDARD_CERTIFICATE_AUTHORITIES"
        origin_sni                       = true
        origin_type                      = "CUSTOMER"
        ports                            = ""
        standard_certificate_authorities = ["akamai-permissive", ]
        tls_version_title                = ""
        verification_mode                = "CUSTOM"
      }
    }
    behavior {
      cp_code {
        enable_default_content_provider_code = false
        value {
          created_date = 1726066265000
          description  = "lalexand-amd"
          id           = var.cp_code
          name         = "lalexand-amd"
          products     = ["Adaptive_Media_Delivery", ]
        }
      }
    }
    behavior {
      segmented_media_optimization {
        behavior             = "LIVE"
        enable_ull_streaming = false
        show_advanced        = false
      }
    }
    behavior {
      origin_characteristics {
        authentication_method       = "AUTOMATIC"
        authentication_method_title = ""
        country                     = "US_EAST"
        origin_location_title       = ""
      }
    }
    behavior {
      content_characteristics_amd {
        catalog_size            = "UNKNOWN"
        content_type            = "HD"
        dash                    = true
        hds                     = false
        hls                     = true
        popularity_distribution = "UNKNOWN"
        segment_duration_dash   = "SEGMENT_DURATION_4S"
        segment_duration_hls    = "SEGMENT_DURATION_4S"
        segment_size_dash       = "UNKNOWN"
        segment_size_hls        = "UNKNOWN"
        smooth                  = false
      }
    }
    behavior {
      client_characteristics {
        country = "GLOBAL_US_CENTRIC"
      }
    }
    behavior {
      cache_key_query_params {
        behavior    = "INCLUDE"
        exact_match = false
        parameters  = ["_HLS", "max_segments", ]
      }
    }
    behavior {
      auto_domain_validation {
        autodv = ""
      }
    }
    behavior {
      modify_outgoing_request_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = true
        custom_header_name          = "Live-Key"
        new_header_value            = "{{user.PMUSER_LIVE_KEY}}"
        standard_modify_header_name = "OTHER"
      }
    }
    behavior {
      allow_transfer_encoding {
        enabled = true
      }
    }
    behavior {
      http2 {
        enabled = ""
      }
    }
    behavior {
      global_request_number {
        header_name   = "Akamai-GRN"
        output_option = "RESPONSE_HEADER"
      }
    }
    behavior {
      breadcrumbs {
        enabled         = true
        logging_enabled = true
        opt_mode        = false
      }
    }
    children = [
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_extract_r_parameter.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_eu_origin.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_data_stream.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_default_cors_policy.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_vimeo_cors_policy.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_token_auth.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_caching.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_deny_china.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_dmca_la_liga.json,
    ]
  }
}
