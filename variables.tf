variable "vpc_parameters" {
  description = "VPC parameters"
  type = object({
    cidr_block           = string
  })
  default = {
    cidr_block = "10.0.0.0/16"
  }
}

variable "subnet_public_parameters" {
  description = "Public subnet parameters"
  type        = string
  default     = "10.0.1.0/24"
}

variable "root_password" {
  description = "Ubuntu SSH password"
  type        = string
  default     = "admin"
}