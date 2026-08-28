
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_token_auth" {
  rules_v2026_06_09 {
    name                  = "Token Auth"
    criteria_must_satisfy = "all"
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "DOES_NOT_MATCH_ONE_OF"
        normalize            = false
        values               = ["/.well-known/acme-challenge/*", ]
      }
    }
    behavior {
      custom_behavior {
        behavior_id = "cbe_688680797"
      }
    }
  }
}
