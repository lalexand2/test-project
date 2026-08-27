
resource "akamai_property" "this" {
  name        = var.property_name
  product_id  = "prd_Adaptive_Media_Delivery"
  contract_id = var.contract_id
  group_id    = var.group_id

  hostnames {
    cname_from             = var.hostname
    cname_to               = var.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }

  rule_format = data.akamai_property_rules_builder._rule_default.rule_format
  rules = replace( data.akamai_property_rules_builder._rule_default.json, "\"rules\"", "\"comments\": \"${var.property_version_notes}\", \"rules\"")
}

resource "akamai_edge_hostname" "this" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  ip_behavior   = "IPV6_COMPLIANCE"
  product_id    = "prd_Adaptive_Media_Delivery"
  edge_hostname = var.edge_hostname
  use_cases = jsonencode([
    {
      "option" : "LIVE",
      "type" : "GLOBAL",
      "useCase" : "Segmented_Media_Mode"
    }
  ])
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "this-staging" {
  property_id                    = akamai_property.this.id
  contact                        = ["lalexand@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.this.latest_version : akamai_property.this.staging_version
  network                        = "STAGING"
  note                           = "New terraform version"
  auto_acknowledge_rule_warnings = false
}

# NOTE: Be careful when removing this resource as you can disable traffic
#resource "akamai_property_activation" "lalexand-amd-terra_prod-production" {
#  property_id                    = akamai_property.lalexand-amd-terra_prod.id
#  contact                        = []
#  version                        = var.activate_latest_on_production ? akamai_property.this.latest_version : akamai_property.this.production_version
#  network                        = "PRODUCTION"
#  auto_acknowledge_rule_warnings = false
#}



