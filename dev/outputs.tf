output "property_id" {
  value = module.property.property_id
}

output "property_name" {
  value = module.property.property_name
}

output "rule_format" {
  value = data.akamai_property.my_property.rule_format
}

