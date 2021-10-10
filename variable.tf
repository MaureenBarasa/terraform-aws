variable "AWS_ACCESS_KEY" {
  description = "the aws IAM access key"
  type        = string
  default     = "****************"
}

variable "AWS_SECRET_KEY" {
  description = "the aws IAM secret key"
  type        = string
  default     = "********************"
}

variable "AWS_REGION" {
  description = "the AWS region"
  type        = string
  default     = "eu-west-1"
}
