variable "edgerc_path" {
  type    = string
  default = "C:/Users/lalexand/.edgerc"
}

variable "config_section" {
  type    = string
  default = "tf"
}

variable "contract_id" {
  type    = string
  default = "ctr_C-1ED34DY"
}

variable "group_id" {
  type    = string
  default = "grp_63802"
}

variable "activate_latest_on_staging" {
  type    = bool
  default = true
}

variable "activate_latest_on_production" {
  type    = bool
  default = false
}
