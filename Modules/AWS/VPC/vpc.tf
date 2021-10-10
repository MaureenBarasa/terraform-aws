module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                                 = var.Name
  cidr                                 = var.vpc_cidr_block
  vpc_tags                             = var.resource_tags
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60
  flow_log_traffic_type                = "ALL"
  vpc_flow_log_tags                    = var.resource_tags

  azs                    = var.AZ
  private_subnets        = var.private_subnet_cidr_blocks
  private_subnet_tags    = var.resource_tags
  public_subnets         = var.public_subnet_cidr_blocks
  public_subnet_tags     = var.resource_tags
  create_igw             = true
  igw_tags               = var.resource_tags
  enable_nat_gateway     = true
  single_nat_gateway     = false
  reuse_nat_ips          = true
  external_nat_ip_ids    = aws_eip.nat.*.id
  nat_gateway_tags       = var.resource_tags
  one_nat_gateway_per_az = true
  enable_vpn_gateway     = true

}

resource "aws_eip" "nat" {
  count = 2
  vpc   = true
}
