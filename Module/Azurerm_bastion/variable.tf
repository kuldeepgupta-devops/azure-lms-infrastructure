variable "bastions" {
  type = map(object({
    name                = string
    location            = string
    rg_name             = string
    subnet_name         = string
    vnet_name           = string
    public_ip_name      = string
  }))
}