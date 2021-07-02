output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnet_1" {
  description = "IDs of the VPC's private subnets"
  value       = module.vpc.private_subnets[0]
}

output "private_subnet_2" {
  description = "IDs of the VPC's private subnets"
  value       = module.vpc.private_subnets[1]
}

output "public_subnet_1" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets[0]
}

output "public_subnet_2" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets[1]
}
