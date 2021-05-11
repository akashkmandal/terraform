variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "vnets" {
  type = list(object({
    vnet_name     = string
    address_space = list(string)
    #subnets = list(object({
    #  name    = string
    #  address = string
    #}))
  }))
}
