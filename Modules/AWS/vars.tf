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

variable "AMI" {
  description = "the ami image id"
  type        = string
  default     = "ami-0f89681a05a3a9de7"
}

variable "KEY" {
  description = "the ec2 keypair name"
  type        = string
  default     = "maureenaws"
}

variable "COUNT" {
  description = "ec2 instances count"
  type        = number
  default     = 2
}

variable "INSTANCE-TYPE" {
  description = "the ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "SG-NAME" {
  description = "the ec2 instance security group name"
  type        = string
  default     = "dev-ec2-sg"
}

variable "EC2-NAME" {
  description = "the ec2 instance Name"
  type        = string
  default     = "dev-ec2-cluster"
}

variable "VPC-NAME" {
  description = "the ec2 instance Name"
  type        = string
  default     = "AWS-Practice"
}