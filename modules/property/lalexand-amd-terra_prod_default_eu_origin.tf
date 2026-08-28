
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_eu_origin" {
  rules_v2026_06_09 {
    name                  = "EU Origin"
    criteria_must_satisfy = "all"
    criterion {
      match_variable {
        match_case_sensitive = true
        match_operator       = "IS_ONE_OF"
        match_wildcard       = false
        variable_name        = "PMUSER_REGION"
        variable_values      = ["ZXU=", ]
      }
    }
    behavior {
      origin {
        cache_key_hostname               = "ORIGIN_HOSTNAME"
        compress                         = true
        custom_valid_cn_values           = ["{{Origin Hostname}}", "{{Forward Host Header}}", ]
        enable_true_client_ip            = false
        forward_host_header              = "ORIGIN_HOSTNAME"
        hostname                         = "prod.example.com"
        http2_enabled                    = false
        http2_title                      = ""
        http_port                        = 80
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
      set_variable {
        transform      = "NONE"
        value_source   = "EXPRESSION"
        variable_name  = "PMUSER_EU"
        variable_value = "true"
      }
    }
  }
}
