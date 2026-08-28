terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version = ">= 10.3.0"
    }
  }
  required_version = ">= 1.0"
   backend "s3" {
     skip_credentials_validation=true
     skip_region_validation=true
     skip_requesting_account_id=true
     bucket="lalexand-objstore"
     key="dev/terraform.tfstate"
     region="us-east-1"
     endpoints={ s3 = "https://us-east-1.linodeobjects.com" }    
   }

}

provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = "tf"

   
}

module "property" {
  source          = "../modules/property"
  origin_hostname = var.origin_hostname
  cp_code         = var.cp_code
  property_name   = var.property_name
  env             = var.env
  contract_id     = var.contract_id
  group_id        = var.group_id
  hostname        = var.hostname
  edge_hostname   = var.edge_hostname
  property_version_notes = var.property_version_notes
  activate_latest_on_staging = var.activate_latest_on_staging
  activate_latest_on_production = var.activate_latest_on_production
}

data "akamai_property" "my_property" {
  name    = var.property_name
  version = "1"
}

