terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

module "rules" {
  source = "./rules"
}

resource "akamai_edge_hostname" "lalexand-amd-terra-prod-akamaized-net" {
  contract_id   = var.contract_id
  group_id      = var.group_id
  ip_behavior   = "IPV6_COMPLIANCE"
  product_id    = "prd_Adaptive_Media_Delivery"
  edge_hostname = "lalexand-amd-terra-prod.akamaized.net"
  use_cases = jsonencode([
    {
      "option" : "LIVE",
      "type" : "GLOBAL",
      "useCase" : "Segmented_Media_Mode"
    }
  ])
}

resource "akamai_property" "lalexand-amd-terra_prod" {
  name        = "lalexand-amd-terra_prod"
  contract_id = var.contract_id
  group_id    = var.group_id
  product_id  = "prd_Adaptive_Media_Delivery"
  hostnames {
    cname_from             = "lalexand-amd-terra-prod.akamaized.net"
    cname_to               = akamai_edge_hostname.lalexand-amd-terra-prod-akamaized-net.edge_hostname
    cert_provisioning_type = "CPS_MANAGED"
  }
  rule_format = module.rules.rule_format
  rules       = module.rules.rules
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "lalexand-amd-terra_prod-staging" {
  property_id                    = akamai_property.lalexand-amd-terra_prod.id
  contact                        = ["lalexand@akamai.com"]
  version                        = var.activate_latest_on_staging ? akamai_property.lalexand-amd-terra_prod.latest_version : akamai_property.lalexand-amd-terra_prod.staging_version
  network                        = "STAGING"
  auto_acknowledge_rule_warnings = false
}

# NOTE: Be careful when removing this resource as you can disable traffic
resource "akamai_property_activation" "lalexand-amd-terra_prod-production" {
  property_id                    = akamai_property.lalexand-amd-terra_prod.id
  contact                        = ["lalexand@akamai.com"]
  version                        = var.activate_latest_on_production ? akamai_property.lalexand-amd-terra_prod.latest_version : akamai_property.lalexand-amd-terra_prod.production_version
  network                        = "PRODUCTION"
  note                           = "test config"
  auto_acknowledge_rule_warnings = false
}
