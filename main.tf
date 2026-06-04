module "networking" {
  source = "./modules/networking"

  vpc_cidr = var.vpc_cidr

  pub_sub1  = var.pub_sub1
  pub_sub2  = var.pub_sub2

  priv_sub1 = var.priv_sub1
  priv_sub2 = var.priv_sub2

  pub_availability_zone1  = var.pub_availability_zone1
  pub_availability_zone2  = var.pub_availability_zone2

  priv_availability_zone1 = var.priv_availability_zone1
  priv_availability_zone2 = var.priv_availability_zone2
}

module "bastion" {
  source = "./modules/bastion"

  subnet_id = module.networking.public_subnet_ids[0]

  bastion_sg_id = module.security.bastion_sg_id

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "security" {
  source = "./modules/security"

 vpc_id = module.networking.vpc_id
}

module "alb" {
  source = "./modules/alb"

  vpc_id = module.networking.vpc_id

  public_subnets = module.networking.public_subnet_ids

  alb_sg_id = module.security.alb_sg_id
}

module "autoscaling" {
  source           = "./modules/autoscaling"
  private_subnets  = module.networking.private_subnet_ids
  private_sg_id    = module.security.private_sg_id
  target_group_arn = module.alb.target_group_arn

  ltemp_ami   = var.ltemp_ami
  ltemp_itype = var.ltemp_itype
  key_name    = var.key_name
}

#DynamoDb for Visitors Count
# resource "aws_dynamodb_table" "visitor_count" {
#   name         = "visitor-count"
#   billing_mode = "PAY_PER_REQUEST"

#   hash_key = "id"

#   attribute {
#     name = "id"
#     type = "S"
#   }

#   tags = {
#     Name = "visitor-count"
#   }
# }