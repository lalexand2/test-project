
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_deny_china" {
  rules_v2026_06_09 {
    name                  = "Deny China"
    criteria_must_satisfy = "all"
    criterion {
      user_location {
        check_ips      = "CONNECTING"
        country_values = ["CN", ]
        field          = "COUNTRY"
        match_operator = "IS_ONE_OF"
      }
    }
    behavior {
      deny_access {
        enabled = true
        reason  = "default-deny-reason"
      }
    }
  }
}
