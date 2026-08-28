
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_extract_r_parameter" {
  rules_v2026_06_09 {
    name                  = "Extract r parameter"
    criteria_must_satisfy = "all"
    criterion {
      query_string_parameter {
        match_case_sensitive_name = true
        match_operator            = "EXISTS"
        match_wildcard_name       = false
        parameter_name            = "r"
      }
    }
    behavior {
      set_variable {
        extract_location     = "QUERY_STRING"
        query_parameter_name = "r"
        transform            = "URL_DECODE"
        value_source         = "EXTRACT"
        variable_name        = "PMUSER_REGION"
      }
    }
  }
}
