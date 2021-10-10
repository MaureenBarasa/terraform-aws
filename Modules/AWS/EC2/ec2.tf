#instance role
resource "aws_iam_role" "ssm_role" {
  name               = "ssm-dev-ec2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = var.resource_tags
}

#Instance Profile
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-dev-ec2"
  role = aws_iam_role.ssm_role.id
}

#Attach Policies to Instance Role
resource "aws_iam_policy_attachment" "attach1" {
  name       = "ssm1-attachment"
  roles      = [aws_iam_role.ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_policy_attachment" "attach2" {
  name       = "ssm2-attachment"
  roles      = [aws_iam_role.ssm_role.id]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

#The dev instance security group
module "dev-ec2-sg" {
  depends_on          = [module.vpc]
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.3.0"
  name                = var.SG-NAME
  description         = "Allow TLS inbound traffic"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]
  tags                = var.resource_tags
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}

#the ec2 Instance
module "dev-ec2" {
  depends_on             = [module.vpc]
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = var.EC2-NAME
  instance_count         = var.COUNT
  ami                    = var.AMI
  instance_type          = var.INSTANCE-TYPE
  key_name               = var.KEY
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.dev-ec2-sg.security_group_id]
  monitoring             = "true"
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.id
  user_data              = file("/Users/maureenbarasa/Desktop/Terraform-AWS/install-ssm.sh")
  tags                   = var.resource_tags
}
