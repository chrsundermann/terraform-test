variable "resource_location" {
  type        = "string"
  description = ""
  default     = "westeurope"
}

variable "adesso_department" {
  type        = "string"
  description = "Department from adesso AG"
  default     = "mscloudteam"
}

variable "adesso_environment" {
  type        = "string"
  description = "Environment of prod/test/dev"
  default     = "production"
}

variable "adesso_costcenter" {
  type        = "string"
  description = "costcenter of adesso department - number or name"
  default     = "splam"
}

variable "adesso_owner" {
  type        = "string"
  description = "owner of the resources"
  default     = "mscloudteam"
}

variable "adesso_company" {
  type        = "string"
  description = "Company name of the adesso group"
  default     = "adessoag"
}
