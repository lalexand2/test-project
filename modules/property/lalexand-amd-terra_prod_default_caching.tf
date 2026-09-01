
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_caching" {
  rules_v2026_06_09 {
    name                  = "Caching"
    criteria_must_satisfy = "all"
    behavior {
      caching {
        behavior                 = "CACHE_CONTROL_AND_EXPIRES"
        cache_control_directives = ""
        default_ttl              = "15m"
        enhanced_rfc_support     = false
        honor_must_revalidate    = true
        honor_private            = true
        must_revalidate          = false
      }
    }
  }
}
