terraform init
terraform import akamai_edge_hostname.lalexand-amd-terra-prod-akamaized-net ehn_6273845,ctr_C-1ED34DY,grp_63802
terraform import akamai_property.lalexand-amd-terra_prod prp_1389323,ctr_C-1ED34DY,grp_63802,7
terraform import akamai_property_activation.lalexand-amd-terra_prod-staging prp_1389323:STAGING
terraform import akamai_property_activation.lalexand-amd-terra_prod-production prp_1389323:PRODUCTION
