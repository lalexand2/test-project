
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_data_stream" {
  rules_v2026_06_09 {
    name                  = "DataStream"
    criteria_must_satisfy = "all"
    children = [
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_data_stream_for_gcs.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_data_stream_for_traffic_peak_random_variable.json,
      data.akamai_property_rules_builder.lalexand-amd-terra_prod_rule_data_stream_for_traffic_peak.json,
    ]
  }
}

data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_data_stream_for_gcs" {
  rules_v2026_06_09 {
    name                  = "DataStream for GCS"
    criteria_must_satisfy = "all"
    behavior {
      datastream {
        log_enabled      = false
        log_stream_title = ""
        stream_type      = "LOG"
      }
    }
  }
}

data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_data_stream_for_traffic_peak_random_variable" {
  rules_v2026_06_09 {
    name                  = "DataStream for TrafficPeak Random variable"
    criteria_must_satisfy = "all"
    behavior {
      set_variable {
        generator         = "RAND"
        max_random_number = 100
        min_random_number = 1
        transform         = "NONE"
        value_source      = "GENERATE"
        variable_name     = "PMUSER_RANDOM_VARIABLE"
      }
    }
  }
}

data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_data_stream_for_traffic_peak" {
  rules_v2026_06_09 {
    name                  = "DataStream for TrafficPeak"
    criteria_must_satisfy = "all"
    criterion {
      match_variable {
        match_operator      = "IS_LESS_THAN_OR_EQUAL_TO"
        variable_expression = "20"
        variable_name       = "PMUSER_RANDOM_VARIABLE"
      }
    }
    behavior {
      datastream {
        log_enabled      = false
        log_stream_title = ""
        stream_type      = "LOG"
      }
    }
  }
}
