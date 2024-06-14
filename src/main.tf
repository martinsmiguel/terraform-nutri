terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "nutri-prod-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"

  bucket = "nutri-"
  acl    = "private"

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}

module "ec2" {
  source = "./modules/ec2"

  public_subnet_ids = module.vpc.public_subnets

  instance_type = var.ec2_instance_type

  tags = {
    Terraform   = "true"
    Environment = "prod"
    Role        = "web_server"
  }

  depends_on = [module.vpc]
}

module "rds" {
  source = "./modules/rds"

  private_subnet_ids = module.vpc.private_subnets

  db_instance_class = var.rds_instance_class
  db_name           = var.rds_db_name
  username          = var.rds_username
  password          = var.rds_password

  tags = {
    Terraform   = "true"
    Environment = "prod"
    Role        = "database"
  }

  depends_on = [module.vpc]

}
