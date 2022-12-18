# Frontend Subnet Name
variable "fe_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type        = string
  default     = "fesubnet"
}
# Frontend Address Space
variable "fe_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type        = list(string)
  default     = ["192.168.0.0/25"]
}

# Backend Subnet Name
variable "be_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type        = string
  default     = "besubnet"
}
# Backend Address Space
variable "be_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type        = list(string)
  default     = ["192.168.0.128/25"]
}