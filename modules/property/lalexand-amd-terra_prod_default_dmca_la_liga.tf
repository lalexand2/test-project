
data "akamai_property_rules_builder" "lalexand-amd-terra_prod_rule_dmca_la_liga" {
  rules_v2026_06_09 {
    name                  = "dmca La_liga"
    comments              = <<EOT
DMCA :	F-CS-10283834
DMCA:  F-CS-10306830 /*/7725b1ca-1270-43b1-86cc-297116932455/avc/540p/*
dmca: F-CS-10379307
dmca: F-CS-10380623
DMCA: F-CS-10405009 /*/313aa35f-20b2-46b9-929b-7e8ba69b15a8_fmp4/avc/360p/*
DMCA: F-CS-10405024 /*/81750a68-144c-4852-b033-ae3035ac96c7_fmp4/avc/360p/*
DMCA =: F-CS-10434667 ->/*/52571699-5138-48f9-a0aa-dcafe41bc25d_fmp4/avc/720p/* 
DMCA F-CS-10481410 /*/88cbf043-272f-4b02-9b5c-b2235bfcbafc/avc/360p/*
DMCA F-CS-10481470 /*/0f82e0c0-f3fa-4c8b-8257-6c6ba7d32efb_fmp4/avc/540p/*
DMCA F-CS-10506523 /*/f7eb31a9-3bfe-49db-91fe-a03da5a56509/avc/540p/* 

  
EOT
    criteria_must_satisfy = "all"
    criterion {
      user_location {
        check_ips      = "CONNECTING"
        country_values = ["ES", ]
        field          = "COUNTRY"
        match_operator = "IS_ONE_OF"
      }
    }
    criterion {
      hostname {
        match_operator = "IS_ONE_OF"
        values         = ["live-ak.vimeocdn.com", ]
      }
    }
    criterion {
      path {
        match_case_sensitive = false
        match_operator       = "MATCHES_ONE_OF"
        normalize            = false
        values               = ["/*/4eb4afea-7917-4d32-a66f-b68546b1d2c1/*", "/*/7725b1ca-1270-43b1-86cc-297116932455/avc/540p/*", "/*/4a173eca-37a6-411d-a66b-705a22637e41_fmp4/avc/540p/*", "/*/9a398cc0-7517-4054-ba24-573be73682dc_fmp4/avc/540p/*", "/*/50de431e-6351-4453-969a-543301b1ca4a_fmp4/avc/540p/*", "/*/87adf43e-a76e-4ac7-838c-60e2085ac29c_fmp4/avc/*", "/*/81750a68-144c-4852-b033-ae3035ac96c7_fmp4/avc/360p/*", "/*/313aa35f-20b2-46b9-929b-7e8ba69b15a8_fmp4/avc/360p/*", "/*/4cd70513-82b1-4c9f-b044-162fb7238f67_fmp4/avc/360p/*", "/*/d88aa4d1-69d5-4fa3-bd54-587d4d0f0c3d_fmp4/avc/240p/*", "/*/2e38b513-ee9c-4b10-a873-4614d568ca5f_fmp4/avc/360p/*", "/*/52571699-5138-48f9-a0aa-dcafe41bc25d_fmp4/avc/720p/*", "/*/88cbf043-272f-4b02-9b5c-b2235bfcbafc/avc/360p/*", "/*/0f82e0c0-f3fa-4c8b-8257-6c6ba7d32efb_fmp4/avc/540p/*", "/*/f7eb31a9-3bfe-49db-91fe-a03da5a56509/avc/540p/*", "/*/644a2d4b-4d57-4dec-9719-7ed701c4f473_fmp4/avc/720p/*", "/*/d776b43d-e4c8-4446-8064-a5d69841ee93_fmp4/avc/*", "/*/3274dbcd-86ca-427c-a473-e6b7b83c7c15_fmp4/avc/540p/*", "/*/60865ab2-bcaa-44fb-9ff7-bfecbe3aae40/avc/720p/*", "/*/8b2ad746-4f79-4dee-b326-f936ade5486d_fmp4/avc/240p/*", ]
      }
    }
    behavior {
      deny_access {
        enabled = true
        reason  = "deny"
      }
    }
  }
}
