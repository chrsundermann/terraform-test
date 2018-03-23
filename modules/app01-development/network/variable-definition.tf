variable "identifier" {
  type        = "string"
  description = ""
  default     = ""
}

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
  description = "Environment of prod/dev"
  default     = "development"
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

variable "vnet_address_space" {
  type        = "string"
  description = ""
  default     = "172.0.0.0/24"
}

variable "subnet_private_cidr" {
  type        = "string"
  description = ""
  default     = "172.0.0.0/25"
}

variable "subnet_public_cidr" {
  type        = "string"
  description = ""
  default     = "172.0.0.128/25"
}
