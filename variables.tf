variable "Vnet" {
  description = "This block is used to set the name of vnet"
  type        = string
  default     = "vnet-var-block"
}

variable "vnet-address" {
  description = "This block is use to set the name of Address sapce for My Vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "subnet" {
  description = "This is used the name of work-subnet "
  type        = string
  default     = "work-sn-var-block"
}

variable "subnet-address" {
  description = "This is used to subnet address"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nsg" {
  description = "This is used thr name of nsg"
  type        = string
  default     = "nsg1-var-block"
}


