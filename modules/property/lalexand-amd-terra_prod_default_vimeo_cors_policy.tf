
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_vimeo_cors_policy" {
  rules_v2026_06_09 {
    name                  = "Vimeo CORS Policy"
    criteria_must_satisfy = "all"
    criterion {
      request_header {
        header_name                = "Origin"
        match_case_sensitive_value = true
        match_operator             = "IS_ONE_OF"
        match_wildcard_name        = false
        match_wildcard_value       = true
        values                     = ["https://player.vimeo.com", "https://vimeo.com", "https://*.vimeows.com", "http://embed.vhx.tv", "https://embed.vhx.tv", "http://embed.vhxqa1.com", "https://embed.vhxqa1.com", "http://embed.vhxqa2.com", "https://embed.vhxqa2.com", "http://embed.vhxqa3.com", "https://embed.vhxqa3.com", "http://embed.vhxqa4.com", "https://embed.vhxqa4.com", "http://embed.vhxqa5.com", "https://embed.vhxqa5.com", "http://embed.vhxqa6.com", "https://embed.vhxqa6.com", "http://embed.vhxqa7.com", "https://embed.vhxqa7.com", "http://embed.vhxqa8.com", "https://embed.vhxqa8.com", "http://embed.crystal.local", "https://embed.crystal.local", "https://embed.daveyeu.com", "https://embed.criterionchannel.com", "https://*.vimeo.work", "https://embed.vhxstaging.com", ]
      }
    }
    behavior {
      set_variable {
        extract_location = "CLIENT_REQUEST_HEADER"
        header_name      = "Origin"
        transform        = "NONE"
        value_source     = "EXTRACT"
        variable_name    = "PMUSER_ORIGIN"
      }
    }
    behavior {
      modify_outgoing_response_header {
        action                      = "MODIFY"
        avoid_duplicate_headers     = true
        new_header_value            = "{{user.PMUSER_ORIGIN}}"
        standard_modify_header_name = "ACCESS_CONTROL_ALLOW_ORIGIN"
      }
    }
  }
}
