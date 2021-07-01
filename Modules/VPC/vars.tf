variable "vpc_cidr_block" {
  description = "the CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "the number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "the number of private subnets."
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "the Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "the Available cidr blocks for private subnets."
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
  ]
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    Project     = "AWS-Test",
    Environment = "UAT",
    CreatedBy   = "Maureen Barasa"
  }
}

variable "AZ" {
  description = "the Available cidr blocks for public subnets."
  type        = list(string)
  default = [
    "eu-west-1a",
    "eu-west-1b",
  ]
}
